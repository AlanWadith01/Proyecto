import 'package:flutter/material.dart';

class RadiografiasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lista de radiografías ficticias; reemplaza con datos reales
    final radiografias = <String>[]; // Lista vacía para el ejemplo

    return Scaffold(
      appBar: AppBar(
        title: Text('Radiografías'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (radiografias.isEmpty)
              Text('No hay radiografías', style: TextStyle(fontSize: 16, color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: radiografias.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(radiografias[index]),
                    );
                  },
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción para montar una nueva radiografía
              },
              child: Text('Montar Radiografía'),
            ),
          ],
        ),
      ),
    );
  }
}