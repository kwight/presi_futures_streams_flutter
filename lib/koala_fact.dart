import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'data.dart';

class KoalaFact extends StatefulWidget {
  @override
  _KoalaFactState createState() => _KoalaFactState();
}

class _KoalaFactState extends State<KoalaFact> {
  Future<String> fact = Future.value('🐨');

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return CupertinoActivityIndicator(
          radius: 15,
        );
        break;
      default:
        return Text(
          '${snapshot.data}',
          style: TextStyle(
            fontSize: snapshot.data == '🐨' ? 48 : 24.0,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text('Koala Fact'),
            onPressed: () {
              setState(() {
                fact = fetchKoalaFact();
              });
            },
          ),
          FutureBuilder(
            future: fact,
            builder: builder,
          ),
        ],
      ),
    );
  }
}
