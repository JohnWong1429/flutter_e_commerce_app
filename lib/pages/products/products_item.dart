import 'package:flutter/material.dart';

class ProductsItem extends StatefulWidget {
  final String image;
  const ProductsItem({
    super.key,
    required this.image,
  });

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
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
                  widget.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Row(
              children: [
                Divider(
                  height: 2,
                  thickness: 2,
                ),
                Text('123'),
                Text('123'),
                Text('123'),
                Text('123'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
