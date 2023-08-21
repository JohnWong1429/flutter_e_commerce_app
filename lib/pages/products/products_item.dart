import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/products/products_detail_page.dart';
import 'package:my_e_commerce_app/widgets/rating.dart';

class ProductsItem extends StatelessWidget {
  final bool isGridView;
  final String image;
  final String title;
  final String? desc;
  final double rating;
  final String? brand;
  final String? category;
  final int price;
  final double? discountPercentage;
  final int id;

  const ProductsItem({
    super.key,
    required this.image,
    required this.title,
    required this.isGridView,
    this.desc,
    required this.rating,
    this.brand,
    this.category,
    required this.price,
    this.discountPercentage,
    required this.id,
  });

  double dicountedPrice(int price, double discount) {
    final newPrice = price * ((100 - discount) / 100);
    return newPrice;
  }

  void goToProductsDetailPage(
    BuildContext context,
    int productId,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProductsDetailPage(
            id: productId,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  goToProductsDetailPage(context, id);
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isGridView ? 6 : 12,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: isGridView ? 6 : 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: InkWell(
                              onTap: () {
                                goToProductsDetailPage(context, id);
                              },
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: isGridView ? 12 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isGridView ? 2 : 4,
                      ),
                      if (desc != null && !isGridView) ...[
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                desc!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                      ],
                      Row(
                        children: [
                          Rating(
                            rating: rating,
                            size: isGridView ? 16 : 22,
                          ),
                        ],
                      ),
                      if (isGridView) ...[
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                goToProductsDetailPage(context, id);
                              },
                              child: const Text(
                                'More ...',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ],
                  ),
                ),
                if (!isGridView && (brand != null || category != null)) ...[
                  Positioned(
                    bottom: 4,
                    left: 10,
                    child: Row(
                      children: [
                        if (brand != null) ...[
                          Chip(
                            label: Text(
                              brand!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 4,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 78, 101, 211),
                          ),
                        ],
                        const SizedBox(
                          width: 10,
                        ),
                        if (category != null) ...[
                          Chip(
                            label: Text(
                              category!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 4,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 78, 101, 211),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
                Positioned(
                  bottom: isGridView ? 4 : 45,
                  right: 10,
                  child: Container(
                    color: Colors.transparent,
                    child: discountPercentage == null
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  goToProductsDetailPage(context, id);
                                },
                                child: Text(
                                  'USD ${price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: isGridView ? 16 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  goToProductsDetailPage(context, id);
                                },
                                child: Text(
                                  'USD ${price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: isGridView ? 12 : null,
                                    height: 0.5,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 1.5,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  goToProductsDetailPage(context, id);
                                },
                                child: Text(
                                  'USD ${(dicountedPrice(price, discountPercentage!)).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: isGridView ? 16 : 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
                if (!isGridView) ...[
                  Positioned(
                    bottom: 4,
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
