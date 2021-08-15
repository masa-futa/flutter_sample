import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutte_sample_app/main_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: MyAppStateful(),
    );
  }
}

class MyAppStateful extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyAppStateful> {
  Future sample() async {
    print(111);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body: Consumer<MainModel>(
          builder: (context, model, snapshot) {
            return Center(
              child: Column(
                children: [
                  Text(model.countText.toString(), style: TextStyle(fontSize: 30)),
                  countButton(model),
                  centerintrinsicWidth(),
                  padding(),
                  row(),
                  // listView()
                ],
              ),
            );
          }
        )
      ),
    );
  }
  /// カウントアップボタン
  Widget countButton(MainModel model) {
    return RaisedButton(
      child: Text("CountUp!!"),
        onPressed: () {
          model.changeText();
        });
  }

  Widget centerintrinsicWidth() {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text("IntrinsicWidth"),
            Text("IntrinsicWidth"),
            Text("IntrinsicWidth"),
            Text("IntrinsicWidth")
          ],
        ),
      ),
    );
  }

  Widget padding() {
    return Padding(
      padding: EdgeInsets.all(50),
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text("padding"),
            Text("padding"),
            Text("padding"),
            Text("padding")
          ],
        ),
      ),
    );
  }

  Widget row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("row"),
        Text("row"),
        Text("row"),
        Text("row"),
      ],
    );
  }
  /// ListView
  // Widget listView() {
  //   return ListView.builder(
  //       itemBuilder: (context, index) {
  //         return RaisedButton(
  //           child: Text("count: $index"),
  //             onPressed: () {}
  //             );
  //       },
  //       itemCount: 5,
  //       );
  // }
}