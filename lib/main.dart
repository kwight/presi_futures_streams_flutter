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
    StreamProvider(
      create: (_) => Firestore.instance.collection('koalas').snapshots(),
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Have A Koala'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Koala Facts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            title: Text('Koala Stream'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            title: Text('Feed The Koalas'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 3:
            return KoalaTabView(
              child: KoalaFirestore(),
            );
          case 2:
            return KoalaTabView(
              child: KoalaFeed(),
            );
          case 1:
            return KoalaTabView(
              child: KoalaFact(),
            );
          case 0:
          default:
            return KoalaTabView(
              child: Koala(),
            );
        }
      },
    );
  }
}

class KoalaTabView extends StatelessWidget {
  final Widget child;
  KoalaTabView({this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: child,
        ),
      ),
    );
  }
}
