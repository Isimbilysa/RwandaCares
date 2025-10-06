import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://YOUR_BACKEND_URL/api'; // replace with your backend

  static Future<Map<String, dynamic>> register({
  required String firstname,
  required String lastname,
  required String email,
  required String password,
  required String role, // e.g., "VOLUNTEER"
}) async {
  final url = Uri.parse('$baseUrl/auth/register');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'role': role,
    }),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception(jsonDecode(response.body)['message'] ?? 'Registration failed');
  }
}
static Future<Map<String, dynamic>> login({
  required String email,
  required String password,
}) async {
  final url = Uri.parse('$baseUrl/auth/login');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
  }
}
  
}
