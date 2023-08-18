import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/products/products_item.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool _isGridView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          height: 50.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isGridView = !_isGridView;
                  });
                },
                icon: _isGridView
                    ? const Icon(
                        Icons.view_list_sharp,
                        size: 28,
                      )
                    : const Icon(
                        Icons.grid_view_sharp,
                      ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            crossAxisCount: _isGridView ? 2 : 1,
            mainAxisSpacing: _isGridView ? 12 : 24,
            crossAxisSpacing: 12,
            children: context
                    .read<ProductsProvider>()
                    .allProducts
                    ?.products
                    ?.map((product) => ProductsItem(
                          isGridView: _isGridView,
                          image: product.thumbnail ?? '',
                          title: product.title ?? 'Products Title',
                          desc: product.description,
                        ))
                    .toList() ??
                [],
          ),
        ),
      ],
    );
  }
}
