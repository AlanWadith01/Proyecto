import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenerarHistorialClinicoPage extends StatefulWidget {
  @override
  _GenerarHistorialClinicoPageState createState() => _GenerarHistorialClinicoPageState();
}

class _GenerarHistorialClinicoPageState extends State<GenerarHistorialClinicoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _documentoController = TextEditingController();
  String _nombrePaciente = '';
  String _telefono = '';
  String _email = '';
  List<Map<String, dynamic>> _citas = [];
  List<Map<String, dynamic>> _retratamientos = [];

  final String _baseUrl = 'https://tu-backend-url.com'; 

  Future<void> _obtenerDatosPaciente() async {
    final documento = _documentoController.text;
    try {
      final response = await http.get(Uri.parse('$_baseUrl/pacientes/$documento'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _nombrePaciente = data['nombre'];
          _telefono = data['telefono'];
          _email = data['email'];
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al obtener los datos del paciente.'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
    }
  }

  Future<void> _obtenerHistorialClinico() async {
    final documento = _documentoController.text;
    try {
      final response = await http.get(Uri.parse('$_baseUrl/historial/$documento'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _citas = List<Map<String, dynamic>>.from(data['citas']);
          _retratamientos = List<Map<String, dynamic>>.from(data['retratamientos']);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al obtener el historial clínico.'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Historial Clínico'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _documentoController,
                  decoration: InputDecoration(
                    labelText: 'Número de Documento del Paciente',
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _obtenerDatosPaciente();
                    } else {
                      setState(() {
                        _nombrePaciente = '';
                        _telefono = '';
                        _email = '';
                        _citas.clear();
                        _retratamientos.clear();
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el número de documento';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                if (_nombrePaciente.isNotEmpty) ...[
                  Text('Nombre: $_nombrePaciente'),
                  Text('Teléfono: $_telefono'),
                  Text('Correo Electrónico: $_email'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _obtenerHistorialClinico,
                    child: Text('Obtener Historial Clínico'),
                  ),
                ],
                if (_citas.isNotEmpty || _retratamientos.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Text('Historial de Citas:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _citas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Fecha: ${_citas[index]['fecha']}'),
                        subtitle: Text('Hora: ${_citas[index]['hora']} - Motivo: ${_citas[index]['motivo']}'),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  Text('Historial de Retratamientos:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _retratamientos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Fecha: ${_retratamientos[index]['fecha']}'),
                        subtitle: Text('Tipo: ${_retratamientos[index]['tipo']}'),
                      );
                    },
                  ),
                ] else if (_nombrePaciente.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Text('No se encontraron citas o retratamientos para este paciente.'),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
