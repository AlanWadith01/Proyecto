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
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (var entry in paciente.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${entry.key}:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        entry.value.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para editar la información
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarPacientePage(paciente: paciente),
                  ),
                );
              },
              child: Text('Editar Información'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RadiografiasPage(pacienteId: paciente['id']),
                  ),
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

class EditarPacientePage extends StatelessWidget {
  final Map<String, dynamic> paciente;

  EditarPacientePage({required this.paciente});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Paciente'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Página de edición para ${paciente['nombre']}'),
      ),
    );
  }
}
