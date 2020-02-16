import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
          Center(
            // child: Koala(),
            child: Koala(),
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
      future: Future.delayed(Duration(seconds: 2), () => '🐨'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CupertinoActivityIndicator(
            radius: 20,
          );
        }
        return Text(
          snapshot.data,
          style: TextStyle(fontSize: 200),
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
