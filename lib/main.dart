import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_e_commerce_app/content_page.dart';
import 'package:my_e_commerce_app/login_page.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          ContentPage.routeName: (_) => const ContentPage(),
          LoginPage.routeName: (_) => const LoginPage(),
        },
      ),
    );
  }
}
