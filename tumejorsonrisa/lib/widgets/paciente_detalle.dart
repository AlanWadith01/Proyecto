import 'package:flutter/material.dart';
import 'package:tumejorsonrisa/widgets/radiografias.dart';

class PacienteDetallePage extends StatelessWidget {
  final Map<String, dynamic> paciente;

  PacienteDetallePage({required this.paciente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var entry in paciente.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${entry.key}: ${entry.value}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para editar la información
              },
              child: Text('Editar Información'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RadiografiasPage()),
                );
              },
              child: Text('Radiografías'),
            ),
          ],
        ),
      ),
    );
  }
}
