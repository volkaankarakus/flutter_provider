import 'package:flutter/material.dart';
import 'package:flutter_provider/product/global/product_context.dart';
import 'package:flutter_provider/product/global/user_context.dart';
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
  /* final LoginViewModel _loginViewModel = LoginViewModel(); */

  final String name = 'Name';
  final String data = 'Login';
  final login = 'Login';
  final String data2 = 'Remember me';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: _loadingWidget(),
            title: Text(context.read<UserContext?>()?.name ?? ''),
            actions: [Text(context.watch<ProductContext>().newUsername)],
          ),
          body: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ImageEnums.door.toImage),
              Selector<LoginViewModel, String>(
                selector: (_, model) => model.username,
                builder: (context, value, _) {
                  return Text(
                    value,
                    style: Theme.of(context).textTheme.headline3,
                  );
                },
              ),
              TextField(
                decoration: ProjectInputs(name),
                onChanged: context.read<LoginViewModel>().setUsername,
              ),
              ElevatedButton(
                  onPressed: context.read<LoginViewModel>().isLoading
                      ? null
                      : () {
                          context.read<LoginViewModel>().controlTextValue();
                        },
                  child: Center(child: Text(data))),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProductContext>().changeName('volkan');
                  },
                  child: Text('Change title'))
            ],
          ),
        );
      },
    );
  }

  Widget _loadingWidget() {
    return Selector<LoginViewModel, bool>(
      selector: (context, viewModel) {
        return viewModel.isLoading;
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
