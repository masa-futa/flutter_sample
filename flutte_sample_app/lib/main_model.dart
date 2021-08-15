
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  var text = 'マサキ';

  void changeText() {
    text = "変更後マサキ";
    notifyListeners();
  }
}