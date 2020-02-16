import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme().copyWith(bodyText2: TextStyle(fontSize: 30)),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Koala(),
            ),
          ),
        ],
      ),
    );
  }
}

class Koala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future.delayed(Duration(seconds: 2), () => '🐨'),
      future: fetchKoalaFact(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CupertinoActivityIndicator(
            radius: 20,
          );
        }
        return Text(
          // snapshot.data,
          jsonDecode(snapshot.data.body)['fact'],
          // style: TextStyle(fontSize: 200),
        );
      },
    );
  }
}

// class Donkey extends StatefulWidget {
//   @override
//   _DonkeyState createState() => _DonkeyState();
// }

// class _DonkeyState extends State<Donkey> {
//   Future<int> donkeys = Future.value(0);

//   Widget builder(BuildContext context, AsyncSnapshot snapshot) {
//     switch (snapshot.connectionState) {
//       case ConnectionState.waiting:
//         return CupertinoActivityIndicator();
//         break;
//       default:
//         return Text('${snapshot.data} donkeys!');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         CupertinoButton(
//           child: Text('Click me!'),
//           onPressed: () {
//             setState(() {
//               donkeys = Future.delayed(Duration(seconds: 2), () => 5);
//             });
//           },
//         ),
//         FutureBuilder(
//           future: donkeys,
//           builder: builder,
//         ),
//       ],
//     );
//   }
// }

// // class Charles extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     var data = Data();
// //   }
// // }

// class Data {
//   Future get fetchData => Future.delayed(Duration(seconds: 2), () => 5);
// }
