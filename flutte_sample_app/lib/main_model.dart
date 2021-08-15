
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  var countText = 1;

  void changeText() {
    countText = countText + 1;
    notifyListeners();
  }
}