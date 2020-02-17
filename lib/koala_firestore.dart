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
                      KoalaData data =
                          KoalaData.fromDocument(koalas.documents[index]);
                      return CloudKoala(
                        id: data.id,
                        size: data.size,
                        color: data.color,
                      );
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
    this.color = CupertinoColors.activeBlue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => feedKoala(id, size),
      child: Container(
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
