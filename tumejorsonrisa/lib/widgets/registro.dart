import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroPaciente extends StatefulWidget {
  const RegistroPaciente({super.key});

  @override
  _RegistroPacienteState createState() => _RegistroPacienteState();
}

class _RegistroPacienteState extends State<RegistroPaciente> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fechaNacimientoController = TextEditingController();

  String? nombre, apellido, numeroDocumento, tipoDocumento, direccion, ciudad, telefono, estadoCivil, sexo, raza, tipoSangre, ocupacion, eps, alergias, cirugias;
  DateTime? fechaNacimiento;

  String _emergency_nombre = '';
  String _emergency_direccion = '';
  String _emergency_ciudad = '';
  String _emergency_telefono = '';
  String _emergency_relacion = '';

  @override
  void dispose() {
    _fechaNacimientoController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final Map<String, dynamic> data = {
        'nombre': nombre,
        'apellido': apellido,
        'fecha_nacimiento': fechaNacimiento?.toIso8601String(),
        'tipo_documento': tipoDocumento,
        'numero_documento': numeroDocumento,
        'direccion': direccion,
        'ciudad': ciudad,
        'telefono': telefono,
        'estado_civil': estadoCivil,
        'sexo': sexo,
        'raza': raza,
        'tipo_sangre': tipoSangre,
        'ocupacion': ocupacion,
        'eps': eps,
        'alergias': alergias,
        'cirugias': cirugias,
        'emergency_contact': {
          'nombre': _emergency_nombre,
          'direccion': _emergency_direccion,
          'ciudad': _emergency_ciudad,
          'telefono': _emergency_telefono,
          'relacion': _emergency_relacion,
        },
      };

      try {
        final response = await http.post(
          Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/patients'), // Corrección en la URL
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Paciente registrado con éxito')),
          );
          _formKey.currentState!.reset();
        } else {
          throw Exception('Failed to register paciente');
        }
      } catch (e) {
        debugPrint('Error submitting form: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar paciente')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Paciente'),
        backgroundColor: Colors.blue, 
        elevation: 0,
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
                  children: [
                    _buildTextField('Nombre', (value) => nombre = value, true, Icons.person),
                    _buildTextField('Apellido', (value) => apellido = value, true, Icons.person),
                    _buildDatePicker('Fecha de Nacimiento', (value) => fechaNacimiento = value, true, Icons.calendar_today),
                    _buildDropdown('Tipo documento', ['Cédula Ciudadanía', 'Tarjeta De Identidad', 'Cédula Extranjera'], (value) => tipoDocumento = value, true),
                    _buildTextField('Número Documento', (value) => numeroDocumento = value, true, Icons.assignment_ind),
                    _buildTextField('Dirección', (value) => direccion = value, true, Icons.home),
                    _buildTextField('Ciudad', (value) => ciudad = value, true, Icons.location_city),
                    _buildTextField('Número de Teléfono', (value) => telefono = value, true, Icons.phone, TextInputType.phone),
                    _buildDropdown('Estado Civil', ['Soltero/a', 'Casado/a', 'Viudo/a', 'Divorciado/a'], (value) => estadoCivil = value, true),
                    _buildDropdown('Sexo', ['Masculino', 'Femenino', 'Prefiero no decirlo'], (value) => sexo = value, true),
                    _buildDropdown('Raza Étnica', ['Mestizo', 'Blanco', 'Afrodescendiente', 'Indígena', 'Mulato', 'Asiático', 'Otro'], (value) => raza = value, true),
                    _buildDropdown('Tipo de Sangre', ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'], (value) => tipoSangre = value, true),
                    _buildTextField('Ocupación', (value) => ocupacion = value, false, Icons.work),
                    _buildTextField('EPS', (value) => eps = value, false, Icons.local_hospital),
                    _buildTextField('Alergias', (value) => alergias = value, true, Icons.warning),
                    _buildTextField('Cirugías', (value) => cirugias = value, true, Icons.medical_services),

                    const SizedBox(height: 20),
                    const Text(
                      'Contacto de Emergencia',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _buildTextField('Nombre y Apellido (Contacto de Emergencia)', (value) => _emergency_nombre = value!, true, Icons.person),
                    _buildTextField('Dirección (Contacto de Emergencia)', (value) => _emergency_direccion = value!, true, Icons.home),
                    _buildTextField('Ciudad (Contacto de Emergencia)', (value) => _emergency_ciudad = value!, true, Icons.location_city),
                    _buildTextField('Número de Teléfono (Contacto de Emergencia)', (value) => _emergency_telefono = value!, true, Icons.phone, TextInputType.phone),
                    _buildTextField('Relación con el Paciente (Contacto de Emergencia)', (value) => _emergency_relacion = value!, true, Icons.family_restroom),

                    const SizedBox(height: 20.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Registrar Paciente'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.blue, // Color del texto del botón
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20), // Bordes redondeados
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, void Function(String?) onSaved, bool required, [IconData? icon, TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Por favor, ingrese $label.';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDatePicker(String label, void Function(DateTime?) onSaved, bool required, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _fechaNacimientoController,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            setState(() {
              _fechaNacimientoController.text = "${picked.toLocal()}".split(' ')[0];
              onSaved(picked);
            });
          }
        },
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Por favor, seleccione $label.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, void Function(String?) onChanged, bool required) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Por favor, seleccione $label.';
          }
          return null;
        },
      ),
    );
  }
}
