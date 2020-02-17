import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart';

class KoalaFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var koalas = Provider.of<QuerySnapshot>(context);
    return koalas == null
        ? CupertinoActivityIndicator()
        : GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              KoalaData data = KoalaData.fromMap(koalas.documents[index].data);
              return CloudKoala(
                size: data.size,
                color: data.color,
              );
            },
          );
  }
}

class CloudKoala extends StatelessWidget {
  final int size;
  final Color color;

  CloudKoala({
    this.size = 50,
    this.color = CupertinoColors.activeBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Text(
        '🐨',
        style: TextStyle(
          fontSize: size.toDouble(),
        ),
      ),
    );
  }
}
