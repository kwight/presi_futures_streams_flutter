import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'koala.dart';
import 'koala_fact.dart';
import 'koala_feed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme().copyWith(bodyText2: TextStyle(fontSize: 30)),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
