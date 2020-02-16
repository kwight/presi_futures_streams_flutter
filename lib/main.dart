import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'koala.dart';
import 'koala_fact.dart';
import 'koala_feed.dart';
import 'koala_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'KoalaAid',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                // child: Koala(),
                // child: KoalaFact(),
                child: KoalaFeed(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
