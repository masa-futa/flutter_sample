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
                  Text(model.text, style: TextStyle(fontSize: 30),),
                  RaisedButton(
                    child: Text("ボタン"),
                  onPressed: () {
                      model.changeText();
                  },)
                ],
              ),
            );
          }
        )
      ),
    );
  }

}