import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutte_sample_app/main_model.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

final counteProvider = StateNotifierProvider((_) => Counter());

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

void main() {
  runApp(
      ProviderScope(
        child: RiverPodTest()
      ),
  );
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

class RiverPodTest extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(counteProvider.state);
    final counter = useProvider(counteProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("title: RiverPodTest"),
        ),
        body: Center(
          child: Text(state.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => counter.increment(),
        ),
      ),
    );
  }

}

class MyAppStateful extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyAppStateful> {
  Future _launchNativeScreen() async {
    await _methodCannel.invokeMethod("test", "parameters");
  }

  MethodChannel _methodCannel = MethodChannel("package.name/masaki");

  @override
  Widget build(BuildContext context) {
    return Text("");
    /// 以下はprovider model
    // return ChangeNotifierProvider<MainModel>(
    //   create: (_) => MainModel(),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Sample App"),
    //     ),
    //     body: Consumer<MainModel>(
    //       builder: (context, model, snapshot) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(model.countText.toString(), style: TextStyle(fontSize: 30)),
    //               countButton(model),
    //               methodButton(),
    //               centerintrinsicWidth(),
    //               padding(),
    //               row(),
    //               // listView()
    //             ],
    //           ),
    //         );
    //       }
    //     )
    //   ),
    // );
  }

  /// カウントアップボタン
  Widget countButton(MainModel model) {
    return RaisedButton(
      child: Text("CountUp!!"),
        onPressed: () {
          model.changeText();
        });
  }

  Widget methodButton() {
    return RaisedButton(
        child: Text("Method!!"),
        onPressed: () {
          _launchNativeScreen();
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