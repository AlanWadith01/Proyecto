import 'package:flutter/material.dart';
import 'package:tumejorsonrisa/widgets/generarreporte.dart';
import 'package:tumejorsonrisa/widgets/programarcita.dart';
import 'package:tumejorsonrisa/widgets/programarretratamiento.dart';
import 'package:tumejorsonrisa/widgets/registro.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu Mejor Sonrisa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Programarcita()));
                    },
                    child: Text('Programar cita'),
                  ),
                ),
                SizedBox(width: 10), // Espacio entre los dos botones
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramarretraPage()));
                    },
                    child: Text('Programar Retratamiento'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => GenerarreportePage()));
                },
                child: Text('Generar Informe'),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar Paciente',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                // Aquí puedes agregar tus elementos de la lista
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  child: Text('Lista de Pacientes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RegistroPaciente()));
                  },
                  child: Text('Registrar Paciente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
