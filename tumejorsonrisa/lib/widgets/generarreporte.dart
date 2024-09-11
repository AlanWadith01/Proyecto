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
  bool _isLoadingPaciente = false;
  bool _isLoadingHistorial = false;

  final String _baseUrl = 'https://f43e-191-95-23-42.ngrok-free.app/'; // Ajusta según corresponda

  Future<void> _obtenerDatosPaciente() async {
    final documento = _documentoController.text;
    setState(() {
      _isLoadingPaciente = true;
      _nombrePaciente = '';
      _telefono = '';
      _email = '';
    });
    try {
      final response = await http.get(Uri.parse('$_baseUrl/paciente/$documento')); // Ajusta el endpoint
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _nombrePaciente = data['nombre'];
          _telefono = data['telefono'];
          _email = data['email'];
          _isLoadingPaciente = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al obtener los datos del paciente.'),
        ));
        setState(() => _isLoadingPaciente = false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
      setState(() => _isLoadingPaciente = false);
    }
  }

  Future<void> _obtenerHistorialClinico() async {
    final documento = _documentoController.text;
    setState(() => _isLoadingHistorial = true);
    try {
      final response = await http.get(Uri.parse('$_baseUrl/historial/$documento')); // Ajusta el endpoint
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _citas = List<Map<String, dynamic>>.from(data['citas']);
          _retratamientos = List<Map<String, dynamic>>.from(data['retratamientos']);
          _isLoadingHistorial = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al obtener el historial clínico.'),
        ));
        setState(() => _isLoadingHistorial = false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
      setState(() => _isLoadingHistorial = false);
    }
  }

  Widget _buildHistorialSection(String title, List<Map<String, dynamic>> items, String Function(Map<String, dynamic>) itemBuilder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        SizedBox(height: 8),
        items.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itemBuilder(items[index])),
                );
              },
            )
          : Text('No hay datos disponibles', style: TextStyle(fontSize: 16.0)),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generar Historial Clínico'),
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
                TextFormField(
                  controller: _documentoController,
                  decoration: InputDecoration(
                    labelText: 'Número de Documento del Paciente',
                    prefixIcon: Icon(Icons.assignment_ind, color: Colors.blue),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
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
                if (_isLoadingPaciente) ...[
                  Center(child: CircularProgressIndicator()),
                ] else if (_nombrePaciente.isNotEmpty) ...[
                  Text('Nombre: $_nombrePaciente', style: TextStyle(fontSize: 16.0)),
                  Text('Teléfono: $_telefono', style: TextStyle(fontSize: 16.0)),
                  Text('Correo Electrónico: $_email', style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoadingPaciente || _documentoController.text.isEmpty
                        ? null
                        : _obtenerHistorialClinico,
                    child: _isLoadingHistorial
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Obtener Historial Clínico'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
                SizedBox(height: 16),
                if (!_isLoadingHistorial && (_citas.isNotEmpty || _retratamientos.isNotEmpty)) ...[
                  _buildHistorialSection(
                    'Historial de Citas:',
                    _citas,
                    (item) => 'Fecha: ${item['fecha']} - Hora: ${item['hora']} - Motivo: ${item['motivo']}',
                  ),
                  _buildHistorialSection(
                    'Historial de Retratamientos:',
                    _retratamientos,
                    (item) => 'Fecha: ${item['fecha']} - Tipo: ${item['tipo']}',
                  ),
                ] else if (_nombrePaciente.isNotEmpty) ...[
                  SizedBox(height: 16),
                  Text('No se encontraron citas o retratamientos para este paciente.', style: TextStyle(fontSize: 16.0)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
