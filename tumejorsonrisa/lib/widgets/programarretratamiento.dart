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

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
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
    try {
      final response = await http.get(Uri.parse('http://<tu-ngrok-url>/pacientes/$documento'));
      if (response.statusCode == 200) {
        final paciente = json.decode(response.body);
        setState(() {
          _nombreController.text = paciente['nombres'];
          _apellidoController.text = paciente['apellidos'];
          _telefonoController.text = paciente['telefono'];
          _emailController.text = paciente['email'];
        });
      } else {
        throw Exception('Error al cargar información del paciente');
      }
    } catch (e) {
      print('Error al autocompletar: $e');
    }
  }

  void _searchPatient() {
    final documento = _documentoController.text;
    if (documento.isNotEmpty) {
      _autofillContactInfo(documento);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programación de Citas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    ),
                  ],
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                  ),
                  enabled: false,
                ),
                TextFormField(
                  controller: _apellidoController,
                  decoration: InputDecoration(
                    labelText: 'Apellido',
                  ),
                  enabled: false,
                ),
                TextFormField(
                  controller: _telefonoController,
                  decoration: InputDecoration(
                    labelText: 'Número de Teléfono',
                  ),
                  keyboardType: TextInputType.phone,
                  enabled: false,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: false,
                ),
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
                ),
                SizedBox(height: 16.0),
                Text('Fecha de la Cita:'),
                Row(
                  children: [
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
                Text('Hora de la Cita:'),
                Row(
                  children: [
                    Text(_selectedTime == null
                        ? 'No seleccionada'
                        : _selectedTime!.format(context)),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () => _selectTime(context),
                    ),
                  ],
                ),
                TextField(
                  controller: _motivoController,
                  decoration: InputDecoration(
                    labelText: 'Motivo de la Cita',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        }
                      },
                      child: Text('Programar Cita'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
