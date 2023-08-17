import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:provider/provider.dart';

class HomePageHeroSection extends StatelessWidget {
  const HomePageHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: Image.network(context
              .read<ProductsProvider>()
              .allProducts
              ?.products?[1]
              .images?[0]),
        ),
      ],
    );
  }
}
