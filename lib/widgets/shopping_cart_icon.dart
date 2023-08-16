import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/cart/cart_page.dart';
import 'package:badges/badges.dart' as badges;

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              fontSize: null, //two digits = fontsize 10, one digit = null
            ),
          ),
          position: badges.BadgePosition.topEnd(
            top: -14,
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ),
    );
  }
}
