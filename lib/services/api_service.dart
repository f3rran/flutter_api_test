import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://api.thedogapi.com/v1";

  Future<List<dynamic>> fetchBreeds() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/breeds'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception(
          "Error ${response.statusCode}: ${response.reasonPhrase}",
        );
      }
    } catch (e) {
      throw Exception(
        "Can not connect to the API. Check your Internet connection.",
      );
    }
  }
}
