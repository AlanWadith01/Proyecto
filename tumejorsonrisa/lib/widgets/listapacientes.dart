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

  @override
  void initState() {
    super.initState();
    _fetchPacientes();
  }

  Future<void> _fetchPacientes() async {
    try {
      final response = await http.get(Uri.parse('http://<tu-ngrok-url>/pacientes'));
      if (response.statusCode == 200) {
        setState(() {
          pacientes = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load pacientes');
      }
    } catch (e) {
      print('Error fetching pacientes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: pacientes.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  final paciente = pacientes[index];
                  final nombreCompleto = '${paciente['nombres']} ${paciente['apellidos']}';
                  return ListTile(
                    title: Text(nombreCompleto),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PacienteDetallePage(paciente: paciente),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistroPaciente()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, 
    );
  }
}
