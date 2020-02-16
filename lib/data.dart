import 'package:http/http.dart';

Future<Response> fetchKoalaFact() {
  return get('https://some-random-api.ml/facts/koala');
}
