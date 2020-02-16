import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final koalaFeeding = StreamController();
// final koalaFeeding = StreamController.broadcast();

class KoalaFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FeedKoalas(),
        HungryKoala(),
        // HungryKoala(),
      ],
    );
  }
}

class FeedKoalas extends StatefulWidget {
  @override
  _FeedKoalasState createState() => _FeedKoalasState();
}

class _FeedKoalasState extends State<FeedKoalas> {
  double size = 50.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('Feed The Koalas!'),
      color: CupertinoColors.activeBlue,
      onPressed: () {
        setState(() {
          size = size + 30;
        });
        koalaFeeding.sink.add(size);
      },
    );
  }
}

class HungryKoala extends StatelessWidget {
  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    return AnimatedDefaultTextStyle(
        style: TextStyle(fontSize: snapshot.data),
        duration: Duration(seconds: 1),
        curve: Curves.elasticInOut,
        child: Text('🐨'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: koalaFeeding.stream,
      initialData: 50.0,
      builder: builder,
    );
  }
}
