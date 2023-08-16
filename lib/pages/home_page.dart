import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/login_page.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      drawer: const SideBar(),
    );
  }
}
