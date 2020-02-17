import 'package:flutter/cupertino.dart';
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

class KoalaData {
  final int size;
  final Color color;

  KoalaData({
    this.size = 50,
    this.color = CupertinoColors.activeBlue,
  });

  factory KoalaData.fromMap(Map<String, dynamic> data) {
    var color;
    switch (data['color']) {
      case 'green':
        color = CupertinoColors.activeGreen;
        break;
      case 'orange':
        color = CupertinoColors.activeOrange;
        break;
      case 'blue':
      default:
        color = CupertinoColors.activeBlue;
        break;
    }
    return KoalaData(
      size: data['size'],
      color: color,
    );
  }
}
