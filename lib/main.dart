import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_e_commerce_app/pages/home_page.dart';
import 'package:my_e_commerce_app/pages/login_page.dart';

void main() {
  runApp(const KeyboardVisibilityProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          LoginPage.routeName: (_) => const LoginPage(),
        },
      ),
    );
  }
}
