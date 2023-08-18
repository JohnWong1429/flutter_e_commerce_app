import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_e_commerce_app/pages/products/products_page.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:provider/provider.dart';

class HomePageHeroSection extends StatelessWidget {
  const HomePageHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductsPage.routeName);
              },
              splashColor: const Color.fromARGB(255, 232, 237, 241),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Featured Products',
                      style: TextStyle(
                        color: Color.fromARGB(180, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ProductsPage.routeName);
            },
            splashColor: Colors.transparent,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 320,
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
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Image.network(e?.images?[0]),
                  );
                });
              }).toList(),
            ),
          ),
        ),
        if (context.read<ProductsProvider>().products.length >= 8) ...[
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductsPage.routeName);
                },
                splashColor: const Color.fromARGB(255, 232, 237, 241),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Trending Products',
                        style: TextStyle(
                          color: Color.fromARGB(180, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductsPage.routeName);
              },
              splashColor: Colors.transparent,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 320,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: true,
                  reverse: true,
                ),
                items: (context.read<ProductsProvider>().products.sublist(4, 8))
                    .map((e) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Image.network(e?.images?[0]),
                    );
                  });
                }).toList(),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
