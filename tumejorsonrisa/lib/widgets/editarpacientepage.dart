import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditarPacientePage extends StatefulWidget {
  final Map<String, dynamic> paciente;

  EditarPacientePage({required this.paciente});

  @override
  _EditarPacientePageState createState() => _EditarPacientePageState();
}

class _EditarPacientePageState extends State<EditarPacientePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nombreController;
  late TextEditingController _apellidoController;
  late TextEditingController _telefonoController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: widget.paciente['nombre']);
    _apellidoController = TextEditingController(text: widget.paciente['apellido']);
    _telefonoController = TextEditingController(text: widget.paciente['telefono']);
    _emailController = TextEditingController(text: widget.paciente['email']);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _actualizarPaciente() async {
    if (_formKey.currentState!.validate()) {
      try {
        final url = Uri.parse('https://c121-191-95-19-112.ngrok-free.app/api/patients/${widget.paciente['id']}');
        final response = await http.put(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'nombre': _nombreController.text,
            'apellido': _apellidoController.text,
            'telefono': _telefonoController.text,
            'email': _emailController.text,
          }),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Información actualizada exitosamente')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al actualizar la información')),
          );
        }
      } catch (e) {
        print('Error al actualizar la información: $e');
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
        title: Text('Editar Información del Paciente'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el apellido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  labelText: 'Número de Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el número de teléfono';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el correo electrónico';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: _actualizarPaciente,
                  child: Text('Guardar Cambios'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

