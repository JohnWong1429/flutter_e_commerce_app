import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/cart_page.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';
import 'package:badges/badges.dart' as badges;

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
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartPage.routeName);
                },
                icon: badges.Badge(
                  badgeContent: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          null, //two digits = fontsize 10, one digit = null
                    ),
                  ),
                  position: badges.BadgePosition.topEnd(
                    top: -14,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                )),
          )
        ],
      ),
      drawer: const SideBar(),
    );
  }
}
