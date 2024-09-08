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
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  List<Map<String, String>> appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments(""); // Fetch all appointments on initialization
  }

  Future<void> fetchAppointments(String query) async {
    final url = Uri.parse('http://tu-servidor-rails.com/api/appointments?query=$query');
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
            'retratamientoPendiente': item['retratamientoPendiente']?.toString() ?? 'No'
          }).toList();
        });
      } else {
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en la conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Mejor Sonrisa'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Cerrar sesión',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Programarcita()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text('Programar Cita', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProgramarretraPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text('Programar Retratamiento', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenerarreportePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.all(14),
                    ),
                    child: Text('Generar Reportes', style: TextStyle(fontSize: 18)),
                  ),
                ),
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
                      border: OutlineInputBorder(),
                      hintText: 'Buscar por ID',
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    fetchAppointments(searchController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 4),
                      Text('Buscar'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'CITAS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Tipo ID')),
                              DataColumn(label: Text('Identificación')),
                              DataColumn(label: Text('Nombre Paciente')),
                              DataColumn(label: Text('Odontólogo')),
                              DataColumn(label: Text('Fecha')),
                              DataColumn(label: Text('Hora')),
                              DataColumn(label: Text('Descripción de Cita')),
                              DataColumn(label: Text('Retratamiento Pendiente')),
                            ],
                            rows: appointments.map((appointment) {
                              return DataRow(cells: [
                                DataCell(Text(appointment['tipoId']!)),
                                DataCell(Text(appointment['id']!)),
                                DataCell(Text(appointment['nombre']!)),
                                DataCell(Text(appointment['odontologo']!)),
                                DataCell(Text(appointment['fecha']!)),
                                DataCell(Text(appointment['hora']!)),
                                DataCell(Text(appointment['descripcion']!)),
                                DataCell(Text(appointment['retratamientoPendiente']!)),
                              ]);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListaPacientesPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: Text('Lista de Pacientes', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistroPaciente()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    child: Text('Registrar Paciente', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
