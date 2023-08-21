import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/widgets/rating.dart';

class ProductsItem extends StatelessWidget {
  final bool isGridView;
  final String image;
  final String title;
  final String? desc;
  final double rating;

  const ProductsItem({
    super.key,
    required this.image,
    required this.title,
    required this.isGridView,
    this.desc,
    required this.rating,
  });

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
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
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
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: isGridView ? 12 : 24,
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
                      height: 8,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
