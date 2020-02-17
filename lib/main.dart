import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'koala.dart';
import 'koala_fact.dart';
import 'koala_feed.dart';
import 'koala_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider<QuerySnapshot>.value(
          value: Firestore.instance.collection('koalas').snapshots(),
        ),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KoalaFirestore(),
      ),
    );
  }
}
