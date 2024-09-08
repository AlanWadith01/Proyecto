import 'package:flutter/material.dart';
import 'package:tumejorsonrisa/widgets/registro.dart';
import 'package:tumejorsonrisa/widgets/paciente_detalle.dart'; // Importa la vista de detalles del paciente

class ListaPacientesPage extends StatelessWidget {
  // Esta es una lista de pacientes de ejemplo, deberías reemplazarla con datos reales.
  final List<String> pacientes = ['Paciente 1', 'Paciente 2', 'Paciente 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pacientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistroPaciente()),
                );
              },
              child: Text('Agregar Paciente'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pacientes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pacientes[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PacienteDetallePage(paciente: pacientes[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
