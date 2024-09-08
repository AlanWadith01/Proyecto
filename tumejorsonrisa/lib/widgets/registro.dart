import 'package:flutter/material.dart';

class RegistroPaciente extends StatefulWidget {
  @override
  _RegistroPacienteState createState() => _RegistroPacienteState();
}

class _RegistroPacienteState extends State<RegistroPaciente> {
  final _formKey = GlobalKey<FormState>();
  String? nombre, apellido, numeroDocumento, tipoDocumento, direccion, ciudad, telefono, estadoCivil, sexo, raza, tipoSangre, ocupacion, eps, alergias, cirugias;
  DateTime? fechaNacimiento;

  String _emergencyNombre = '';
  String _emergencyDireccion = '';
  String _emergencyCiudad = '';
  String _emergencyTelefono = '';
  String _emergencyRelacion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField('Nombre', (value) => nombre = value, true),
              _buildTextField('Apellido', (value) => apellido = value, true),
              _buildDatePicker('Fecha de Nacimiento', (value) => fechaNacimiento = value, true),
              _buildDropdown('Tipo documento', ['Cédula Ciudadanía', 'Tarjeta De Identidad', 'Cédula Extranjera'], (value) => tipoDocumento = value, true),
              _buildTextField('Número Documento', (value) => numeroDocumento = value, true),
              _buildTextField('Dirección', (value) => direccion = value, true),
              _buildTextField('Ciudad', (value) => ciudad = value, true),
              _buildTextField('Número de Teléfono', (value) => telefono = value, true, TextInputType.phone),
              _buildDropdown('Estado Civil', ['Soltero/a', 'Casado/a', 'Viudo/a', 'Divorciado/a'], (value) => estadoCivil = value, true),
              _buildDropdown('Sexo', ['Masculino', 'Femenino', 'Prefiero no decirlo'], (value) => sexo = value, true),
              _buildDropdown('Raza Étnica', ['Mestizo', 'Blanco', 'Afrodescendiente', 'Indígena', 'Mulato', 'Asiático', 'Otro'], (value) => raza = value, true),
              _buildDropdown('Tipo de Sangre', ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'], (value) => tipoSangre = value, true),
              _buildTextField('Ocupación', (value) => ocupacion = value, false),
              _buildTextField('EPS', (value) => eps = value, false),
              _buildTextArea('Alergias', (value) => alergias = value),
              _buildTextArea('Cirugías', (value) => cirugias = value),

              SizedBox(height: 20),
              Text(
                'Contacto de Emergencia',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              _buildTextField('Nombre y Apellido (Contacto de Emergencia)', (value) => _emergencyNombre = value!, true),
              _buildTextField('Dirección (Contacto de Emergencia)', (value) => _emergencyDireccion = value!, true),
              _buildTextField('Ciudad (Contacto de Emergencia)', (value) => _emergencyCiudad = value!, true),
              _buildTextField('Número de Teléfono (Contacto de Emergencia)', (value) => _emergencyTelefono = value!, true, TextInputType.phone),
              _buildTextField('Relación (Contacto de Emergencia)', (value) => _emergencyRelacion = value!, false),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Lógica para manejar el formulario completo
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Formulario enviado con éxito')));
                  }
                },
                child: Text('Registrar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved, bool required, [TextInputType keyboardType = TextInputType.text]) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown(String label, List<String> items, Function(String?) onChanged, [bool required = false]) {
    String? selectedValue;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
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
    );
  }

  Widget _buildTextArea(String label, Function(String?) onSaved) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      maxLines: 4,
      onSaved: onSaved,
    );
  }

  Widget _buildDatePicker(String label, Function(DateTime?) onSaved, bool required) {
  DateTime? selectedDate;
  return GestureDetector(
    onTap: () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (pickedDate != null) {
        setState(() {
          selectedDate = pickedDate;
        });
        onSaved(pickedDate);
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label, 
          hintText: selectedDate != null ? selectedDate.toLocal().toString().split(' ')[0] : 'Seleccionar fecha',
        ),
        validator: (value) => required && selectedDate == null ? 'Este campo es obligatorio' : null,
        controller: TextEditingController(
          text: selectedDate != null ? selectedDate.toLocal().toString().split(' ')[0] : '',
        ),
      ),
    ),
  );
}
}