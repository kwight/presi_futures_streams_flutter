import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'data.dart';

class KoalaFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class KoalaStream extends StatelessWidget {
  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return CupertinoActivityIndicator(
          radius: 20,
        );
        break;
      default:
        return Text('${snapshot.data}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: counter(),
      builder: builder,
    );
  }
}
