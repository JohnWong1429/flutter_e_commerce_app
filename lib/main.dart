import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_e_commerce_app/pages/about_us_page.dart';
import 'package:my_e_commerce_app/pages/cart/cart_page.dart';
import 'package:my_e_commerce_app/pages/home_page.dart';
import 'package:my_e_commerce_app/pages/login_page.dart';
import 'package:my_e_commerce_app/pages/products/products_page.dart';
import 'package:my_e_commerce_app/pages/users/user_page.dart';

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
          CartPage.routeName: (_) => const CartPage(),
          UserPage.routeName: (_) => const UserPage(),
          AboutUsPage.routeName: (_) => const AboutUsPage(),
          ProductsPage.routeName: (_) => const ProductsPage(),
        },
      ),
    );
  }
}
