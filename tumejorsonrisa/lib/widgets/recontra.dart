import 'package:flutter/material.dart';

class RecoverPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar contraseña'),
      ),
      body: Stack(
        children: [

          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            blendMode: BlendMode.darken,
            child: Image.asset(
              "lib/images/fondo.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ingresa tu correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Correo electrónico',
                                hintText: 'm@example.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu correo electrónico';
                                }
                                final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                                if (!emailRegExp.hasMatch(value)) {
                                  return 'Por favor ingresa un correo electrónico válido';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Correo enviado. Verifique su bandeja de entrada.')),
                                  );
                                }
                              },
                              child: Text('Enviar correo electrónico'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Volver al inicio'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

