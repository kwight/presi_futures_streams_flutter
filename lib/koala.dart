import 'package:flutter/cupertino.dart';

class Koala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2), () => '🐨'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          alignment: Alignment.center,
          child: snapshot.hasData
              ? Text(
                  snapshot.data,
                  style: TextStyle(fontSize: 90),
                )
              : CupertinoActivityIndicator(
                  radius: 15,
                ),
        );
      },
    );
  }
}
