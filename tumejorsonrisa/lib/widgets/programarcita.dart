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
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();

  String? _selectedDoctor;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isLoading = false;

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

  Future<void> _autofillContactInfo(String numero_documento) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/patients/${numero_documento}'));
      if (response.statusCode == 200) {
        final paciente = json.decode(response.body);
        setState(() {
          _nombreController.text = paciente['nombre']; 
          _apellidoController.text = paciente['apellido'];
          _telefonoController.text = paciente['telefono'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se encontró información para el documento ingresado')),
        );
      }
    } catch (e) {
      print('Error al autocompletar: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar la información del paciente')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _searchPatient() {
    final numero_documento = _documentoController.text;
    if (numero_documento.isNotEmpty) {
      _autofillContactInfo(numero_documento); 
    }
  }

  Future<void> _programarCita() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final cita = {
        'appointment': {
          'tipoId': _documentoController.text,
          'telefono': _telefonoController.text,
          'doctor': _selectedDoctor ?? '',
          'fecha': _selectedDate?.toIso8601String() ?? '',
          'hora': _selectedTime?.format(context) ?? '',
          'motivo': _motivoController.text,
          'nombre': _nombreController.text,
          'apellido': _apellidoController.text, // Cambiar de _apellidoController a _apellidoController.text
        }
      };

      try {
        final url = Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/appointments');
        final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(cita),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cita programada exitosamente')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al programar la cita: ${response.body}')),
          );
        }
      } catch (e) {
        print('Error al programar la cita: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error en la conexión')),
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
        title: Text('Programación de Citas'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/fondo.jpg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100.withOpacity(0.7), Colors.blue.shade50.withOpacity(0.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
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
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _nombreController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
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
                        border: OutlineInputBorder(),
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
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.phone,
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
                        border: OutlineInputBorder(),
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
                              filled: true,
                              fillColor: Colors.white,
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
