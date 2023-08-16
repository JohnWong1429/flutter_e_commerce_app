import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            child: Text('User Info'),
          ),
          ListTile(
            title: Text('Home Page'),
          ),
          ListTile(
            title: Text('Products'),
          ),
          ListTile(
            title: Text('Cart'),
          ),
          ListTile(
            title: Text('About Us'),
          ),
        ],
      ),
    );
  }
}
