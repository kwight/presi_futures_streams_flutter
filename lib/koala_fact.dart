import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'data.dart';

class KoalaFact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchKoalaFact(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CupertinoActivityIndicator(
            radius: 20,
          );
        }
        return Text(
          jsonDecode(snapshot.data.body)['fact'],
        );
      },
    );
  }
}
