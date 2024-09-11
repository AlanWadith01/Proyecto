import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tumejorsonrisa/widgets/generarreporte.dart';
import 'package:tumejorsonrisa/widgets/listapacientes.dart';
import 'package:tumejorsonrisa/widgets/login.dart';
import 'package:tumejorsonrisa/widgets/programarcita.dart';
import 'package:tumejorsonrisa/widgets/programarretratamiento.dart';
import 'package:tumejorsonrisa/widgets/registro.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  List<Map<String, String>> appointments = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAppointments("");
  }

  Future<void> fetchAppointments(String query) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://c121-191-95-19-112.ngrok-free.app/api/appointments?query=$query');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          appointments = data.map((item) => {
            'tipoId': item['tipoId']?.toString() ?? '',
            'id': item['id']?.toString() ?? '',
            'nombre': item['nombre']?.toString() ?? '',
            'odontologo': item['odontologo']?.toString() ?? '',
            'fecha': item['fecha']?.toString() ?? '',
            'hora': item['hora']?.toString() ?? '',
            'descripcion': item['descripcion']?.toString() ?? '',
            'retratamientoPendiente': item['retratamientoPendiente']?.toString() ?? 'No',
          }).toList();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error en la solicitud: ${response.statusCode}'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error de conexión: $e'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildButton(String text, VoidCallback onPressed, {double fontSize = 13, double padding = 14}) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.all(padding),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Mejor Sonrisa'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                width: 150,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Cerrar sesión',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton('Programar Cita', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Programarcita()),
                  );
                }),
                SizedBox(width: 16),
                _buildButton('Programar Retratamiento', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgramarretraPage()),
                  );
                }, fontSize: 7, padding: 5),
                SizedBox(width: 16),
                _buildButton('Generar Reportes', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenerarHistorialClinicoPage()),
                  );
                }, fontSize: 9, padding: 5),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      fetchAppointments(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                      contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                      hintText: 'Ingrese el Número de Identificación',
                    ),
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    fetchAppointments(searchController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Buscar', style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: appointments.isEmpty
                  ? Center(child: Text('No se encontraron citas'))
                  : ListView.builder(
                      itemCount: appointments.length,
                      itemBuilder: (context, index) {
                        final appointment = appointments[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16.0),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tipo ID: ${appointment['tipoId']}'),
                                Text('Identificación: ${appointment['id']}'),
                                Text('Nombre Paciente: ${appointment['nombre']}'),
                                Text('Odontólogo: ${appointment['odontologo']}'),
                                Text('Fecha: ${appointment['fecha']}'),
                                Text('Hora: ${appointment['hora']}'),
                                Text('Descripción de Cita: ${appointment['descripcion']}'),
                                Text('Retratamiento Pendiente: ${appointment['retratamientoPendiente']}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildButton('Lista de Pacientes', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListaPacientesPage()),
                    );
                  }),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildButton('Registrar Paciente', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroPaciente()),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
