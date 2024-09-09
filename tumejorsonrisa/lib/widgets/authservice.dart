import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl;

  AuthService(this.baseUrl);

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('https://d1e5-181-78-21-163.ngrok-free.app/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['success'] ?? false; 
    } else {
      throw Exception('¡Error! Usuario o Contraseña no validos');
    }
  }
}
