import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';
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
  final String id;
  final int size;
  final Color color;

  KoalaData({
    @required this.id,
    this.size = 50,
    this.color = CupertinoColors.activeBlue,
  });

  factory KoalaData.fromDocument(DocumentSnapshot document) {
    var data = document.data;
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
      id: document.documentID,
      size: data['size'],
      color: color,
    );
  }
}

void feedKoala(String id, int size) {
  var reference = Firestore.instance.document('koalas/$id');
  Firestore.instance.runTransaction((Transaction transaction) async {
    DocumentSnapshot snapshot = await transaction.get(reference);
    if (snapshot.exists) {
      await transaction.update(reference, <String, dynamic>{
        'size': size < 140 ? size + 30 : 140,
        'color': size + 30 >= 140 ? 'green' : 'orange'
      });
    }
  });
}

void resetKoalaSizes() async {
  var koalas = await Firestore.instance.collection('koalas').getDocuments();
  koalas.documents.forEach((koala) {
    var reference = Firestore.instance.document('koalas/${koala.documentID}');
    Firestore.instance.runTransaction((Transaction transaction) async {
      await transaction
          .update(reference, <String, dynamic>{'size': 50, 'color': 'orange'});
    });
  });
}

void rescueKoala() {
  Firestore.instance.collection('koalas').document().setData({
    'size': 50,
    'color': 'orange',
  });
}
