import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgramarretraPage extends StatefulWidget {
  @override
  _ProgramarretraPageState createState() => _ProgramarretraPageState();
}

class _ProgramarretraPageState extends State<ProgramarretraPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();

  String? _selectedDoctor;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _autofillContactInfo(String documento) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/patients/$documento'));
      if (response.statusCode == 200) {
        final paciente = json.decode(response.body);
        setState(() {
          _nombreController.text = paciente['nombres'];
          _apellidoController.text = paciente['apellidos'];
          _telefonoController.text = paciente['telefono'];
          _emailController.text = paciente['email'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se encontró información para el documento ingresado')),
        );
      }
    } catch (e) {
      print('Error al autocompletar: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar información del paciente')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _searchPatient() {
    final documento = _documentoController.text;
    if (documento.isNotEmpty) {
      _autofillContactInfo(documento);
    }
  }

  Future<void> _scheduleRetratamiento() async {
    if (_formKey.currentState!.validate()) {
      final retratamiento = {
        'documento': _documentoController.text,
        'telefono': _telefonoController.text,
        'email': _emailController.text,
        'nombre': _nombreController.text,
        'apellido': _apellidoController.text,
        'motivo': _motivoController.text,
        'fecha': _selectedDate?.toIso8601String() ?? '',
        'hora': _selectedTime?.format(context) ?? '',
        'doctor': _selectedDoctor,
      };

      setState(() {
        _isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/retratamientos'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(retratamiento),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Retratamiento programado con éxito')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al programar retratamiento')),
          );
        }
      } catch (e) {
        print('Error al programar retratamiento: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error de conexión')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programación de Retratamientos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _documentoController,
                          decoration: InputDecoration(
                            labelText: 'Número de Documento',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese el número de documento';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _searchPatient,
                        child: Text('Buscar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _apellidoController,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _telefonoController,
                    decoration: InputDecoration(
                      labelText: 'Número de Teléfono',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.phone,
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    enabled: false,
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: _selectedDoctor,
                    hint: Text('Doctor encargado'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Dra. Natalia Muñoz'),
                        value: 'dra_natalia',
                      ),
                      DropdownMenuItem(
                        child: Text('Dr. Oscar Perez'),
                        value: 'dr_oscar',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedDoctor = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor seleccione un doctor';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Fecha de la Cita:'),
                      SizedBox(width: 8),
                      Text(_selectedDate == null
                          ? 'No seleccionada'
                          : '${_selectedDate!.toLocal()}'.split(' ')[0]),
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Hora de la Cita:'),
                      SizedBox(width: 8),
                      Text(_selectedTime == null
                          ? 'No seleccionada'
                          : _selectedTime!.format(context)),
                      IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectTime(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Detalles',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          controller: _motivoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: 12,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _scheduleRetratamiento,
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : Text('Programar Retratamiento'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Center(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
