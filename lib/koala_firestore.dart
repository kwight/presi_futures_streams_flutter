import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart';

class KoalaFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var koalas = Provider.of<QuerySnapshot>(context);
    return Column(
      children: <Widget>[
        CupertinoButton(
          child: Text('Rescue A Koala!'),
          onPressed: () => rescueKoala(),
          color: CupertinoColors.activeBlue,
        ),
        CupertinoButton(
          child: Text('Reset Koalas'),
          onPressed: () => resetKoalaSizes(),
          color: CupertinoColors.activeBlue,
        ),
        Expanded(
            child: koalas == null
                ? CupertinoActivityIndicator()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: koalas.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CloudKoala.fromDocument(koalas.documents[index]);
                    },
                  )),
      ],
    );
  }
}

class CloudKoala extends StatelessWidget {
  final String id;
  final int size;
  final Color color;

  CloudKoala({
    @required this.id,
    this.size = 50,
    this.color = CupertinoColors.activeOrange,
  });

  factory CloudKoala.fromDocument(DocumentSnapshot document) {
    if (document.data == null) {
      return null;
    }
    var data = document.data;
    var color;
    switch (data['color']) {
      case 'green':
        color = CupertinoColors.activeGreen;
        break;
      case 'orange':
      default:
        color = CupertinoColors.activeOrange;
        break;
    }
    return CloudKoala(
      id: document.documentID,
      size: data['size'],
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => feedKoala(id, size),
      child: AnimatedContainer(
        curve: Curves.easeInExpo,
        duration: Duration(milliseconds: 700),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        alignment: Alignment.center,
        child: AnimatedDefaultTextStyle(
          style: TextStyle(fontSize: size.toDouble()),
          duration: Duration(seconds: 1),
          curve: Curves.elasticInOut,
          child: Text('🐨'),
        ),
      ),
    );
  }
}
