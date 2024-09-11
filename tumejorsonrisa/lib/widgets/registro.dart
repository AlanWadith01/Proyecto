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

  String _emergencyNombre = '';
  String _emergencyDireccion = '';
  String _emergencyCiudad = '';
  String _emergencyTelefono = '';
  String _emergencyRelacion = '';

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
          'nombre': _emergencyNombre,
          'direccion': _emergencyDireccion,
          'ciudad': _emergencyCiudad,
          'telefono': _emergencyTelefono,
          'relacion': _emergencyRelacion,
        },
      };

      try {
        final response = await http.post(
          Uri.parse('https://f43e-191-95-23-42.ngrok-free.app/patiens'),
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
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
                _buildTextField('Nombre y Apellido (Contacto de Emergencia)', (value) => _emergencyNombre = value!, true, Icons.person),
                _buildTextField('Dirección (Contacto de Emergencia)', (value) => _emergencyDireccion = value!, true, Icons.home),
                _buildTextField('Ciudad (Contacto de Emergencia)', (value) => _emergencyCiudad = value!, true, Icons.location_city),
                _buildTextField('Número de Teléfono (Contacto de Emergencia)', (value) => _emergencyTelefono = value!, true, Icons.phone, TextInputType.phone),
                _buildTextField('Relación con el Paciente (Contacto de Emergencia)', (value) => _emergencyRelacion = value!, true, Icons.family_restroom),

                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Registrar Paciente'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, void Function(String?) onSaved, bool required, [IconData? icon, TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: const OutlineInputBorder(),
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
          prefixIcon: icon != null ? Icon(icon) : null,
          border: const OutlineInputBorder(),
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
          border: const OutlineInputBorder(),
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
