import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:provider/provider.dart';

class HomePageHeroSection extends StatelessWidget {
  const HomePageHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: true,
            ),
            items: (context.read<ProductsProvider>().products.length >= 4
                    ? context.read<ProductsProvider>().products.sublist(0, 4)
                    : context.read<ProductsProvider>().products)
                .map((e) {
              return Builder(builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(e?.images?[0]),
                );
              });
            }).toList(),
          ),
        ),
        if (context.read<ProductsProvider>().products.length >= 8) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: true,
                reverse: true,
              ),
              items: (context.read<ProductsProvider>().products.sublist(4, 8))
                  .map((e) {
                return Builder(builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(e?.images?[0]),
                  );
                });
              }).toList(),
            ),
          ),
        ]
      ],
    );
  }
}
