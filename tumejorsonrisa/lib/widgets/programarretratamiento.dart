import 'package:flutter/material.dart';




class ProgramarretraPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProgramarretraPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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

  void _autofillContactInfo(String documento) {
    // Aquí podrías realizar una búsqueda en tu base de datos para obtener la información
    // del contacto basado en el número de documento.
    setState(() {
      // Ejemplo de autocompletado (reemplaza con tu lógica):
      _telefonoController.text = '123456789';
      _emailController.text = 'example@mail.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programación de Retratamiento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
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
                  onChanged: (value) {
                    _autofillContactInfo(value);
                  },
                ),
                TextFormField(
                  controller: _telefonoController,
                  decoration: InputDecoration(
                    labelText: 'Número de Teléfono',
                  ),
                  keyboardType: TextInputType.phone,
                  enabled: false, // Deshabilitado porque se autocompleta
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: false, // Deshabilitado porque se autocompleta
                ),
                DropdownButtonFormField<String>(
                  value: _selectedDoctor,
                  hint: Text('Seleccione un doctor'),
                  items: [
                    DropdownMenuItem(
                      child: Text('Dr. José Martínez'),
                      value: 'dr_jose',
                    ),
                    DropdownMenuItem(
                      child: Text('Dra. Ana Gómez'),
                      value: 'dr_ana',
                    ),
                    DropdownMenuItem(
                      child: Text('Dr. Carlos Rodríguez'),
                      value: 'dr_carlos',
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
                TextFormField(
                  controller: _motivoController,
                  decoration: InputDecoration(
                    labelText: 'Motivo de la Cita',
                  ),
                  maxLines: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Procesar datos aquí
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
