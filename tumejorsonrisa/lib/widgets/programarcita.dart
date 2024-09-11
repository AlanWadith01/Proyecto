import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Programarcita extends StatefulWidget {
  @override
  _ProgramarcitaState createState() => _ProgramarcitaState();
}

class _ProgramarcitaState extends State<Programarcita> {
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

  // Método para seleccionar la fecha
  void _selectDate(BuildContext context) async {
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

  // Método para seleccionar la hora
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

  // Método para autocompletar información del paciente
 Future<void> _autofillContactInfo(String documento) async {
  try {
    final response = await http.get(Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/patients/$documento'));

    if (response.statusCode == 200) {
      final paciente = json.decode(response.body);
      setState(() {
        _nombreController.text = paciente['nombre'] ?? ''; // Ajusta los nombres de los campos según tu respuesta JSON
        _apellidoController.text = paciente['apellido'] ?? '';
        _telefonoController.text = paciente['telefono'] ?? '';
        _emailController.text = paciente['email'] ?? '';
      });
    } else if (response.statusCode == 404) {
      // Paciente no encontrado
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Paciente no encontrado')),
      );
    } else {
      throw Exception('Error al cargar información del paciente');
    }
  } catch (e) {
    print('Error al autocompletar: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al cargar la información del paciente')),
    );
  }
}


  // Método para buscar la información del paciente
  void _searchPatient() {
    final documento = _documentoController.text;
    if (documento.isNotEmpty) {
      _autofillContactInfo(documento);
    }
  }

  // Método para programar la cita
  Future<void> _programarCita() async {
    if (_formKey.currentState!.validate()) {
      try {
        final url = Uri.parse('https://d1e5-181-78-21-163.ngrok-free.app/appointments'); // Cambia esta URL a la de tu servidor de Rails
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'documento': _documentoController.text,
            'telefono': _telefonoController.text,
            'email': _emailController.text,
            'nombre': _nombreController.text,
            'apellido': _apellidoController.text,
            'doctor': _selectedDoctor ?? '',
            'fecha': _selectedDate?.toIso8601String() ?? '',
            'hora': _selectedTime?.format(context) ?? '',
            'motivo': _motivoController.text,
          }),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cita programada exitosamente')),
          );
          Navigator.pop(context); 
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al programar la cita')),
          );
        }
      } catch (e) {
        print('Error al programar la cita: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en la conexión')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programación de Citas'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
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
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  labelText: 'Número de Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                enabled: false,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
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
              SizedBox(height: 8.0),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Motivo de la Cita',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _motivoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _programarCita,
                    child: Text('Programar Cita'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
