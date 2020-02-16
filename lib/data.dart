import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchKoalaFact() async {
  final response = await http.get('https://some-random-api.ml/facts/koala');
  return response.statusCode == 200
      ? jsonDecode(response.body)['fact']
      : 'Error loading fact 😢';
}

Stream<int> counter() async* {
  int i = 0;
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield i++;
    if (i == 10) break;
  }
}
