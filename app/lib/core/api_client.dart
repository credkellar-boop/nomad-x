import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  // Update this to match your Nomad cluster load balancer IP or domain
  static const String baseUrl = 'http://localhost:8000';

  Future<String> translateText(String text, String targetLang) async {
    final url = Uri.parse('$baseUrl/api/v1/translate');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'text': text,
          'target_language': targetLang,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['translated'];
      } else {
        throw Exception('Failed to translate text. Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
