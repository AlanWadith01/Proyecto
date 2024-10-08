import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String baseUrl;

  AuthService(this.baseUrl);

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('https://3fbf-191-95-53-238.ngrok-free.app/login');
    
    try {
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
        throw Exception('Error en la autenticación: ${response.reasonPhrase}');
      }
    } catch (e) {

      throw Exception('Error de conexión: $e');
    }
  }
}
