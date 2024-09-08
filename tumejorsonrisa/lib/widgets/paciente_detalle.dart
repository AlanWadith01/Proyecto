import 'package:flutter/material.dart';
import 'package:tumejorsonrisa/widgets/radiografias.dart';

class PacienteDetallePage extends StatelessWidget {
  final String paciente;

  PacienteDetallePage({required this.paciente});

  @override
  Widget build(BuildContext context) {
    // Datos ficticios del paciente; reemplaza con datos reales
    final pacienteInfo = {
      'Nombre': paciente,
      'Número de Documento': '123456789',
      'Dirección': 'Calle Falsa 123',
      'Ciudad': 'Ciudad Ejemplo',
      'Teléfono': '987654321',
      'Fecha de Nacimiento': '01/01/1990',
      // Agrega más campos según sea necesario
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Paciente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var entry in pacienteInfo.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('${entry.key}: ${entry.value}', style: TextStyle(fontSize: 16)),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la vista de edición de información
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