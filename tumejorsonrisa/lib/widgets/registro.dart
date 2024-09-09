import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistroPaciente extends StatefulWidget {
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
          Uri.parse('http://<tu-ngrok-url>/pacientes'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Paciente registrado con éxito')));
          _formKey.currentState!.reset();
        } else {
          throw Exception('Failed to register paciente');
        }
      } catch (e) {
        print('Error submitting form: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al registrar paciente')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Paciente'),
        backgroundColor: Colors.blue, // Color de fondo del AppBar
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

                SizedBox(height: 20),
                Text(
                  'Contacto de Emergencia',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 20.0),
                _buildTextField('Nombre y Apellido (Contacto de Emergencia)', (value) => _emergencyNombre = value!, true, Icons.person),
                _buildTextField('Dirección (Contacto de Emergencia)', (value) => _emergencyDireccion = value!, true, Icons.home),
                _buildTextField('Ciudad (Contacto de Emergencia)', (value) => _emergencyCiudad = value!, true, Icons.location_city),
                _buildTextField('Número de Teléfono (Contacto de Emergencia)', (value) => _emergencyTelefono = value!, true, Icons.phone, TextInputType.phone),
                _buildTextField('Relación (Contacto de Emergencia)', (value) => _emergencyRelacion = value!, false, Icons.family_restroom),

                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Registrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
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

  Widget _buildTextField(String label, Function(String?) onSaved, bool required, [IconData? icon, TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, Function(String?) onChanged, [bool required = false]) {
    String? selectedValue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        value: selectedValue,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          onChanged(value);
        },
        validator: required 
            ? (value) => (value == null) ? 'Este campo es obligatorio' : null 
            : null,
      ),
    );
  }

  Widget _buildDatePicker(String label, Function(DateTime?) onSaved, bool required, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() {
              fechaNacimiento = pickedDate;
              _fechaNacimientoController.text = pickedDate.toLocal().toString().split(' ')[0];
            });
            onSaved(pickedDate);
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: _fechaNacimientoController,
            decoration: InputDecoration(
              labelText: label,
              hintText: 'Seleccionar fecha',
              prefixIcon: Icon(icon, color: Colors.blue),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) => required && (fechaNacimiento == null) ? 'Este campo es obligatorio' : null,
          ),
        ),
      ),
    );
  }
}
