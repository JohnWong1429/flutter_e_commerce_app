import 'package:flutter/cupertino.dart';

class ProductsInfoTitle extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color? bgColor;
  final Color? textColor;

  const ProductsInfoTitle({
    super.key,
    required this.title,
    this.width = 100,
    this.height = 24,
    this.bgColor = const Color.fromARGB(255, 181, 203, 240),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: -0.05,
          child: Container(
            width: width,
            height: height,
            color: bgColor,
          ),
        ),
        Positioned(
          left: 4,
          top: 2,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
