import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tumejorsonrisa/widgets/citaspage.dart';
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
  List<Map<String, String>> appointments = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchAppointmentsByPatientDocument(String document) async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/appointments/search_by_patient_document?patient_document=$document');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          appointments = data.map((item) => {
            'tipoId': item['tipoId']?.toString() ?? 'No disponible',
            'id': item['id']?.toString() ?? 'No disponible',
            'nombre': item['nombre']?.toString() ?? 'No disponible',
            'doctor': item['doctor']?.toString() ?? 'No disponible',
            'fecha': item['fecha']?.toString() ?? 'No disponible',
            'hora': item['hora']?.toString() ?? 'No disponible',
            'motivo': item['motivo']?.toString() ?? 'No disponible',
            'retratamientoPendiente': item['retratamientoPendiente']?.toString() ?? 'No',
          }).toList();
        });
      } else {
        _showSnackbar('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackbar('Error de conexión: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Widget _buildButton(String text, VoidCallback onPressed, {double fontSize = 14, double padding = 16}) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, 
          padding: EdgeInsets.all(padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Cerrar sesión', style: TextStyle(color: Colors.red, fontSize: 16)),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/fondo.jpg'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.withOpacity(0.7),
              Colors.white.withOpacity(0.5),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainButtonRow(),
              SizedBox(height: 30),
              _buildSearchRow(),
              SizedBox(height: 30),
              _buildAppointmentList(),
              SizedBox(height: 30),
              _buildPatientOptionsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainButtonRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildButton('Programar Cita', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Programarcita()));
            }),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _buildButton('Programar Retratamiento', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramarretraPage()));
            }, fontSize: 12, padding: 10),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _buildButton('Citas', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialCitasPage()));
            }, fontSize: 12, padding: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.blueAccent),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              hintText: 'Ingrese el Número de Identificación',
              hintStyle: TextStyle(color: Colors.blueGrey[600]),
            ),
          ),
        ),
        SizedBox(width: 15),
        ElevatedButton(
          onPressed: () {
            final document = searchController.text;
            if (document.isNotEmpty) {
              fetchAppointmentsByPatientDocument(document);
            } else {
              setState(() {
                appointments.clear();
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          child: Row(
            children: [
              SizedBox(width: 5),
              isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Buscar', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentList() {
    return Expanded(
      child: appointments.isEmpty
          ? Center(
              child: Text(
                'No se encontraron citas',
                style: TextStyle(fontSize: 18, color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return _buildAppointmentCard(appointment);
              },
            ),
    );
  }

  Widget _buildAppointmentCard(Map<String, String> appointment) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Tipo ID:', appointment['tipoId'] ?? 'No disponible'),
            _buildInfoRow('Identificación:', appointment['id'] ?? 'No disponible'),
            _buildInfoRow('Nombre Paciente:', appointment['nombre'] ?? 'No disponible'),
            _buildInfoRow('Doctor:', appointment['doctor'] ?? 'No disponible'),
            _buildInfoRow('Fecha:', appointment['fecha'] ?? 'No disponible'),
            _buildInfoRow('Hora:', appointment['hora'] ?? 'No disponible'),
            _buildInfoRow('Descripción de Cita:', appointment['motivo'] ?? 'No disponible'),
            _buildInfoRow('Retratamiento Pendiente:', appointment['retratamientoPendiente'] ?? 'No'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientOptionsRow() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: _buildButton('Lista de Pacientes', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPacientesPage()));
            }),
          ),
          SizedBox(width: 8),
          Expanded(
            child: _buildButton('Registrar Paciente', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPaciente()));
            }),
          ),
        ],
      ),
    );
  }
}
