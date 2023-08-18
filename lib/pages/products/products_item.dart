import 'package:flutter/material.dart';

class ProductsItem extends StatefulWidget {
  final bool isGridView;
  final String image;
  final String title;
  final String? desc;

  const ProductsItem({
    super.key,
    required this.image,
    required this.title,
    required this.isGridView,
    this.desc,
  });

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
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
                  widget.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.isGridView ? 6 : 12,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: widget.isGridView ? 6 : 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: widget.isGridView ? 12 : 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  if (widget.desc != null && !widget.isGridView) ...[
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.desc!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
