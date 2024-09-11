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
  final _formKey = GlobalKey<FormState>(); // Clave global para manejar el formulario

  @override
  void initState() {
    super.initState();
    _fetchRadiografias(); 
  }

  Future<void> _fetchRadiografias() async {
    try {
      final response = await http.get(Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/patients/${widget.pacienteId}/radiografias'));
      if (response.statusCode == 200) {
        setState(() {
          radiografias = json.decode(response.body);
        });
      } else {
        throw Exception('Error al cargar radiografías');
      }
    } catch (e) {
      _showMessage('Error al cargar radiografías: $e');
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
    if (!_formKey.currentState!.validate() || _selectedImage == null) {
      _showMessage('Por favor, completa todos los campos y selecciona una imagen.');
      return;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/patients/${widget.pacienteId}/radiografias'),
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
        _showMessage('Radiografía agregada exitosamente.');
      } else {
        throw Exception('Error al agregar la radiografía');
      }
    } catch (e) {
      _showMessage('Error al agregar radiografía: $e');
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

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
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
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _descripcionController,
                    decoration: InputDecoration(labelText: 'Descripción'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una descripción';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _tipoController,
                    decoration: InputDecoration(labelText: 'Tipo de Radiografía'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa el tipo de radiografía';
                      }
                      return null;
                    },
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Fecha de Radiografía',
                          hintText: _fechaRadiografia != null ? _fechaRadiografia!.toLocal().toString().split(' ')[0] : 'Seleccionar fecha',
                        ),
                        validator: (value) {
                          if (_fechaRadiografia == null) {
                            return 'Por favor selecciona una fecha';
                          }
                          return null;
                        },
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
          ],
        ),
      ),
    );
  }
}
