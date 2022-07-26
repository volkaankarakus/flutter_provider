import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String? _inputText;

  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  String _username = "Emircan";
  String get username => _username;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  Future<bool> controlTextValue() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 2));
    _changeLoading();

    return _inputText != null;
  }
}
