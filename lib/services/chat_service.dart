import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  final String apiKey = 'YOUR_OPENAI_API_KEY'; // replace with your key

  Future<String> sendMessage(String message) async {
    const apiUrl = 'https://api.openai.com/v1/chat/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "system", "content": "You are a helpful AI assistant for RwandaCares."},
          {"role": "user", "content": message},
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      return "Sorry, I couldn't connect to the AI service 😔.";
    }
  }
}
