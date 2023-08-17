import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/about_us_page.dart';
import 'package:my_e_commerce_app/pages/cart/cart_page.dart';
import 'package:my_e_commerce_app/pages/home/home_page.dart';
import 'package:my_e_commerce_app/pages/login_page.dart';
import 'package:my_e_commerce_app/pages/products/products_page.dart';
import 'package:my_e_commerce_app/pages/users/user_page.dart';
import 'package:my_e_commerce_app/providers/user_providers.dart';
import 'package:provider/provider.dart';

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
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(UserPage.routeName);
                            },
                            child: Image.network(
                                context.read<UserProvider>().user?.image ?? ''),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'id: ${context.read<UserProvider>().user?.id}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'User: ${context.read<UserProvider>().user?.username}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    transitPage(
                      context,
                      HomePage.routeName,
                    );
                  },
                ),
                ListTile(
                  title: const Text('Products'),
                  onTap: () {
                    transitPage(
                      context,
                      ProductsPage.routeName,
                    );
                  },
                ),
                ListTile(
                  title: const Text('Cart'),
                  onTap: () {
                    transitPage(
                      context,
                      CartPage.routeName,
                    );
                  },
                ),
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {
                    transitPage(
                      context,
                      AboutUsPage.routeName,
                    );
                  },
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
              color: Color.fromARGB(255, 190, 13, 0),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  void transitPage(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed(route);
  }
}
