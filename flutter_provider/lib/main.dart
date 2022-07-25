import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark)),
    );
  }
}
