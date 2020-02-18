import 'package:flutter/cupertino.dart';
import 'data.dart';

class KoalaFact extends StatefulWidget {
  @override
  _KoalaFactState createState() => _KoalaFactState();
}

class _KoalaFactState extends State<KoalaFact> {
  Future<String> fact = Future.value('Let\'s load some facts!');

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.done:
        return Text(
          '${snapshot.data}',
          style: TextStyle(
            fontSize: 24.0,
          ),
        );
      case ConnectionState.waiting:
      default:
        return CupertinoActivityIndicator(
          radius: 15,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '🐨',
                style: TextStyle(fontSize: 90),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: FutureBuilder(
                future: fact,
                builder: builder,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: Text('Load Koala Fact'),
                onPressed: () {
                  setState(() {
                    fact = fetchKoalaFact();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
