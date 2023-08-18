import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/users/user_info.dart';
import 'package:my_e_commerce_app/widgets/shopping_cart_icon.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static const routeName = 'user_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Personal Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      drawer: const SideBar(),
      body: const SizedBox(
        width: double.infinity,
        child: UserInfo(),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 240, 225),
    );
  }
}
