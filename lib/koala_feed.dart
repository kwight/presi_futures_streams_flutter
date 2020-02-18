import 'dart:async';
import 'package:flutter/cupertino.dart';

class KoalaFeed extends StatefulWidget {
  @override
  _KoalaFeedState createState() => _KoalaFeedState();
}

class _KoalaFeedState extends State<KoalaFeed> {
  double size = 50.0;
  final feeder = StreamController();
  // final koalaFeeder = StreamController.broadcast();

  @override
  void dispose() {
    feeder.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            child: Text('Feed The Koalas!'),
            color: CupertinoColors.activeBlue,
            onPressed: () {
              setState(() {
                size = size + 30;
              });
              feeder.sink.add(size);
            },
          ),
          HungryKoala(
            feeder: feeder,
          ),
          // HungryKoala(
          //   feeder: feeder,
          // ),
        ],
      ),
    );
  }
}

class HungryKoala extends StatelessWidget {
  final StreamController feeder;
  HungryKoala({this.feeder});

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    return AnimatedDefaultTextStyle(
        style: TextStyle(
          fontSize: snapshot.hasData ? snapshot.data : 50.0,
        ),
        duration: Duration(seconds: 1),
        curve: Curves.elasticInOut,
        child: Text('🐨'));
  }

  Widget connectionAwareBuilder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.active:
        return AnimatedDefaultTextStyle(
            style: TextStyle(fontSize: snapshot.data),
            duration: Duration(seconds: 1),
            curve: Curves.elasticInOut,
            child: Text('🐨'));
      case ConnectionState.done:
        return Text('Connection was closed.');
      case ConnectionState.none:
      case ConnectionState.waiting:
      default:
        return CupertinoActivityIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: feeder.stream,
      builder: builder,
      // builder: connectionAwareBuilder,
    );
  }
}
