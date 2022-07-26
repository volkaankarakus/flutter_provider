import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/product/global/product_context.dart';
import 'package:flutter_provider/product/global/user_context.dart';
import 'package:flutter_provider/view/login_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(create: (context) => ProductContext()),
        ProxyProvider<ProductContext, UserContext?>(
          update: (context, productContext, userContext) {
            return userContext != null
                ? userContext.copyWith(name: productContext.newUsername)
                : UserContext(productContext.newUsername);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark)),
      ),
    );
  }
}
