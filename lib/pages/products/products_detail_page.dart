import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/pages/products/products_detail_info.dart';

import '../../models/api_products_data_model.dart';
import '../../services/api_call.dart';
import '../../widgets/shopping_cart_icon.dart';

class ProductsDetailPage extends StatefulWidget {
  final int id;

  const ProductsDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  bool _isLoading = false;
  ApiProductsDataModelProducts? _product;

  @override
  void initState() {
    super.initState();
    _fetchSingleProduct(widget.id);
  }

  Future<void> _fetchSingleProduct(int id) async {
    setState(() {
      _isLoading = true;
    });

    if (id > 0) {
      final result = await ApiCall.fetchSingleProduct(id);
      if (context.mounted) {
        if (result != null) {
          setState(() {
            _product = result;
          });
        } else {
          _tryAgain();
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _tryAgain() {
    showDialog(
        context: context,
        builder: ((BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Network Error'),
            content: const Text('Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _fetchSingleProduct(widget.id);
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductsDetailInfo(product: _product),
      backgroundColor: const Color.fromARGB(255, 247, 240, 225),
    );
  }
}
