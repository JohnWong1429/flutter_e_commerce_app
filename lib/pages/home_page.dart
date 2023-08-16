import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';

import '../widgets/shopping_cart_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      drawer: const SideBar(),
    );
  }
}
