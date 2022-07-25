import 'package:flutter/material.dart';

enum ImageEnums { door }

extension ImageEnumExtension on ImageEnums {
  String get toPath => 'assets/images/ic_$name.png';
  Image get toImage => Image.asset(toPath);
}
