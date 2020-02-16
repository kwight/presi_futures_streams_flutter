import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchKoalaFact() async {
  final response = await http.get('https://some-random-api.ml/facts/koala');
  return response.statusCode == 200
      ? jsonDecode(response.body)['fact']
      : 'Error loading fact 😢';
}
