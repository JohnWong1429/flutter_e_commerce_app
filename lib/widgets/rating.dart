import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({
    super.key,
    required this.rating,
  });

  /// Icon(Icons.star_border)   hollow
  /// Icon(Icons.star_half)     half
  /// Icon(Icons.star)          full

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...[1, 2, 3, 4, 5].map((e) {
          if (rating >= e) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          } else if (rating >= e - 0.5) {
            return const Icon(
              Icons.star_half,
              color: Colors.amber,
            );
          } else {
            return const Icon(
              Icons.star_border,
              color: Colors.amber,
            );
          }
        })
      ],
    );
  }
}
