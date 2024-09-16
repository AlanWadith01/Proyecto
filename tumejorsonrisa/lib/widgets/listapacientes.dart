import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tumejorsonrisa/widgets/registro.dart';
import 'package:tumejorsonrisa/widgets/paciente_detalle.dart';

class ListaPacientesPage extends StatefulWidget {
  @override
  _ListaPacientesPageState createState() => _ListaPacientesPageState();
}

class _ListaPacientesPageState extends State<ListaPacientesPage> {
  List<dynamic> pacientes = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchPacientes();
  }

  Future<void> _fetchPacientes() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      final response = await http.get(Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/patients'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        try {
          pacientes = json.decode(response.body);
          setState(() {
            isLoading = false;
          });
        } catch (e) {
          setState(() {
            isLoading = false;
            errorMessage = 'Error al procesar JSON: ${e.toString()}';
          });
        }
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Error al cargar pacientes: ${response.statusCode}';
        });
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      setState(() {
        isLoading = false;
        errorMessage = 'Error al cargar pacientes: ${e.toString()}';
      });
    }
  }

  Widget _buildPacienteCard(dynamic paciente) {
    final nombreCompleto = '${paciente['nombre']} ${paciente['apellido']}';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(nombreCompleto),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PacienteDetallePage(paciente: paciente),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacientes'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/fondo.jpg'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100.withOpacity(0.7), Colors.blue.shade50.withOpacity(0.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : errorMessage.isNotEmpty
                    ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)))
                    : RefreshIndicator(
                        onRefresh: _fetchPacientes,
                        child: ListView.builder(
                          itemCount: pacientes.length,
                          itemBuilder: (context, index) => _buildPacienteCard(pacientes[index]),
                        ),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistroPaciente()),
          ).then((_) => _fetchPacientes());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
