import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/constant/image_enums.dart';
import '../../../product/utility/input_decorations.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String name = 'Name';
  final String data = 'Login';
  final login = 'Login';
  final String data2 = 'Remember me';

  final LoginViewModel _loginViewModel = LoginViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: _loadingWidget(),
          ),
          body: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ImageEnums.door.toImage),
              Text(
                login,
                style: Theme.of(context).textTheme.headline3,
              ),
              TextField(decoration: ProjectInputs(name)),
              ElevatedButton(
                  onPressed: _loginViewModel.isLoading
                      ? null
                      : () {
                          _loginViewModel.controlTextValue();
                        }, 
                  child: Center(child: Text(data))),
            ],
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Selector<LoginViewModel, bool>(
      selector: (context, viewModel) {
        return viewModel.isLoading ; 
      },
      builder: (context, value, child) {
        return value
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox();
      },
    );
    return Consumer<LoginViewModel>(builder: (context, value, child) {
      return value.isLoading
          ? Center(child: CircularProgressIndicator())
          : SizedBox();
    });
  }
}
