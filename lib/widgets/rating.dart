import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double? size;

  const Rating({
    super.key,
    required this.rating,
    this.size,
  });

  /// Icon(Icons.star_border)   hollow
  /// Icon(Icons.star_half)     half
  /// Icon(Icons.star)          full

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...[1, 2, 3, 4, 5].map((e) {
          if (rating >= e - 0.25) {
            return Icon(
              Icons.star,
              color: Colors.amber,
              size: size,
            );
          } else if (rating >= e - 0.75) {
            return Icon(
              Icons.star_half,
              color: Colors.amber,
              size: size,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: Colors.amber,
              size: size,
            );
          }
        }),
      ],
    );
  }
}
