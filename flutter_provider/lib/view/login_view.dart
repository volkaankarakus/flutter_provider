import 'package:flutter/material.dart';
import 'package:flutter_provider/product/constant/image_enums.dart';
import 'package:flutter_provider/product/utility/input_decorations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.3,
            child: ImageEnums.door.toImage),
        Text(
          'Login',
          style: Theme.of(context).textTheme.headline4,
        ),
        const TextField(decoration: ProjectInputs('Username')),
        const TextField(
          decoration: ProjectInputs('Password'),
        ),
        ElevatedButton(onPressed: () {}, child: Text('Login'))
      ]),
    );
  }
}
