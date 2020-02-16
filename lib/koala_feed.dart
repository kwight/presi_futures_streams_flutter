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

  onPressed() {
    setState(() {
      size = size + 10;
    });
    koalaFeeding.sink.add(size);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('Feed The Koalas!'),
      color: CupertinoColors.activeBlue,
      onPressed: onPressed,
    );
  }
}

class HungryKoala extends StatelessWidget {
  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    // switch (snapshot.connectionState) {
    //   case ConnectionState.waiting:
    //     return CupertinoActivityIndicator(
    //       radius: 20,
    //     );
    //     break;
    //   default:
    return Text('🐨', style: TextStyle(fontSize: snapshot.data));
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
