import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'dart:io'; 
import 'package:http/http.dart' as http;
import 'dart:convert';

class RadiografiasPage extends StatefulWidget {
  final int pacienteId; 

  RadiografiasPage({required this.pacienteId});

  @override
  _RadiografiasPageState createState() => _RadiografiasPageState();
}

class _RadiografiasPageState extends State<RadiografiasPage> {
  List<dynamic> radiografias = [];
  File? _selectedImage; 
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  DateTime? _fechaRadiografia;

  @override
  void initState() {
    super.initState();
    _fetchRadiografias(); 
  }

Future<void> _fetchRadiografias() async {
  try {
    final response = await http.get(Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/pacientes/${widget.pacienteId}/radiografias'));
    if (response.statusCode == 200) {
      setState(() {
        radiografias = json.decode(response.body);
      });
    } else {
      throw Exception('Error al cargar radiografías');
    }
  } catch (e) {
    print('Error al cargar radiografías: $e');
  }
}


  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery); 
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _addRadiografia() async {
    if (_selectedImage == null) {
      print('Por favor, selecciona una imagen.');
      return;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/${widget.pacienteId}/radiografias'),
    );

    request.fields['descripcion'] = _descripcionController.text;
    request.fields['fecha'] = _fechaRadiografia?.toIso8601String() ?? '';
    request.fields['tipo'] = _tipoController.text;

    request.files.add(await http.MultipartFile.fromPath('imagen', _selectedImage!.path));

    try {
      final response = await request.send();

      if (response.statusCode == 201) {
        _fetchRadiografias(); 
        _resetForm(); 
      } else {
        throw Exception('Error al agregar la radiografía');
      }
    } catch (e) {
      print('Error al agregar radiografía: $e');
    }
  }

  void _resetForm() {
    setState(() {
      _selectedImage = null;
      _descripcionController.clear();
      _tipoController.clear();
      _fechaRadiografia = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radiografías'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (radiografias.isEmpty)
              Text('No hay radiografías', style: TextStyle(fontSize: 16, color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: radiografias.length,
                  itemBuilder: (context, index) {
                    final radiografia = radiografias[index];
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(radiografia['descripcion']),
                        subtitle: Text('Fecha: ${radiografia['fecha']}'),
                        trailing: radiografia['imagen_url'] != null 
                          ? Image.network(radiografia['imagen_url'], width: 100, height: 100, fit: BoxFit.cover)
                          : null,
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            Text('Agregar Nueva Radiografía', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo de Radiografía'),
            ),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _fechaRadiografia = pickedDate;
                  });
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Fecha de Radiografía',
                    hintText: _fechaRadiografia != null ? _fechaRadiografia!.toLocal().toString().split(' ')[0] : 'Seleccionar fecha',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Seleccionar Imagen'),
            ),
            if (_selectedImage != null) 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image.file(_selectedImage!, width: 200, height: 200, fit: BoxFit.cover),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addRadiografia,
              child: Text('Montar Radiografía'),
            ),
          ],
        ),
      ),
    );
  }
}