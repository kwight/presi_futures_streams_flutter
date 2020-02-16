import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KoalaFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var koalas = Provider.of<QuerySnapshot>(context);
    return Container();
  }
}
