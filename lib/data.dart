import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchKoalaFact() async {
  try {
    final response = await http.get('https://some-random-api.ml/facts/koala');
    return response.statusCode == 200
        ? jsonDecode(response.body)['fact']
        : 'Weird. ¯\_(ツ)_/¯';
  } catch (error) {
    return 'Error ${error.toString()} 😢';
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
