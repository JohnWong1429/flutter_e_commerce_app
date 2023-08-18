import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';
import 'package:my_e_commerce_app/pages/products/products_list.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:my_e_commerce_app/services/api_call.dart';
import 'package:my_e_commerce_app/widgets/shopping_cart_icon.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});
  static const routeName = 'products_page';

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchAllProducts();
  }

  Future<void> _fetchAllProducts() async {
    setState(() {
      _isLoading = true;
    });
    final result = await ApiCall.fetchAllProducts();
    if (context.mounted) {
      if (result is ApiProductsDataModel) {
        context.read<ProductsProvider>().allProducts = result;
      }
    }
    setState(() {
      _isLoading = false;
    });
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
      drawer: const SideBar(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const ProductsList(),
    );
  }
}
