import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/login_page.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: const [
                DrawerHeader(
                  child: Text('User Info'),
                ),
                ListTile(
                  title: Text('Home'),
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
          ),
          ListTile(
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Color.fromARGB(255, 190, 13, 0),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
            leading: const Icon(
              Icons.logout,
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
