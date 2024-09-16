import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

extension DateTimeParsing on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class HistorialCitasPage extends StatefulWidget {
  @override
  _HistorialCitasPageState createState() => _HistorialCitasPageState();
}

class _HistorialCitasPageState extends State<HistorialCitasPage> {
  List<Map<String, dynamic>> _citas = [];
  List<Map<String, dynamic>> _citasFiltradas = [];
  DateTime? _fechaSeleccionada;
  bool _isLoading = false;

  final String _baseUrl = 'https://3fbf-191-95-53-238.ngrok-free.app';

  Future<void> _obtenerCitas() async {
    setState(() => _isLoading = true);
    try {
      final response = await http.get(Uri.parse('$_baseUrl/appointments'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _citas = List<Map<String, dynamic>>.from(data);
          _citasFiltradas = _citas; // Mostrar todas las citas inicialmente
          _isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al obtener las citas.'),
        ));
        setState(() => _isLoading = false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
      setState(() => _isLoading = false);
    }
  }

  Future<void> _filtrarCitasPorFecha(DateTime fecha) async {
    setState(() {
      _fechaSeleccionada = fecha;
      _citasFiltradas = _citas
          .where((cita) => DateTime.parse(cita['fecha']).isSameDay(fecha))
          .toList();
    });
  }

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _fechaSeleccionada) {
      _filtrarCitasPorFecha(picked);
    }
  }

  Widget _buildCitasList() {
  return _citasFiltradas.isNotEmpty
      ? ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _citasFiltradas.length,
          separatorBuilder: (context, index) => Divider(color: Colors.blue.shade100),
          itemBuilder: (context, index) {
            final cita = _citasFiltradas[index];
            return ListTile(
              title: Text('Fecha: ${cita['fecha']} - Hora: ${cita['hora']}', style: TextStyle(fontSize: 16.0)),
              subtitle: Text('Motivo: ${cita['motivo']} - Paciente: ${cita['nombre']} ${cita['apellido']}', style: TextStyle(fontSize: 14.0)),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blue.shade100),
              ),
            );
          },
        )
      : Center(child: Text('No hay citas disponibles para la fecha seleccionada.', style: TextStyle(fontSize: 16.0, color: Colors.grey)));
}


  @override
  void initState() {
    super.initState();
    _obtenerCitas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Citas'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Buscar por fecha:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.blue)),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.calendar_today, color: Colors.white),
                      label: Text(
                        _fechaSeleccionada != null
                            ? 'Fecha seleccionada: ${_fechaSeleccionada!.toLocal()}'.split(' ')[0]
                            : 'Seleccionar fecha',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => _seleccionarFecha(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_isLoading)
                Center(child: CircularProgressIndicator())
              else
                _buildCitasList(),
            ],
          ),
        ),
      ),
    );
  }
}
