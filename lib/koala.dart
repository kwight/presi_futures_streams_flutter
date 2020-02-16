import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Koala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2), () => '🐨'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CupertinoActivityIndicator(
            radius: 15,
          );
        }
        return Container(
          child: Text(
            snapshot.data,
            style: TextStyle(fontSize: 100),
          ),
        );
      },
    );
  }
}
