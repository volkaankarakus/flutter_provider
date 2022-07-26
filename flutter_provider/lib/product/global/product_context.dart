import 'package:flutter/material.dart';

class ProductContext extends ChangeNotifier {
  String newUsername = '';

  void changeName(String name) {
    newUsername = name;
    notifyListeners();
  }
}
