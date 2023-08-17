import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';
import 'package:my_e_commerce_app/pages/home/home_page_hero_section.dart';
import 'package:my_e_commerce_app/providers/products_providers.dart';
import 'package:my_e_commerce_app/services/api_call.dart';
import 'package:my_e_commerce_app/widgets/sidebar.dart';
import 'package:provider/provider.dart';

import '../../widgets/shopping_cart_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchSingleProduct([1, 2]);
  }

  Future<void> _fetchSingleProduct(List<int> idList) async {
    setState(() {
      _isLoading = true;
    });
    for (int id in idList) {
      if (id > 0) {
        final result = await ApiCall.fetchSingleProduct(id);

        if (context.mounted) {
          if (result is ApiProductsDataModelProducts) {
            context.read<ProductsProvider>().addProduct(result);
          }
        }
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  // Future<void> _fetchAllProducts() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   final result = await ApiCall.fetchAllProducts();

  //   if (context.mounted) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     if (result is ApiProductsDataModel) {
  //       context.read<ProductsProvider>().allProducts = result;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: const [
          ShoppingCartIcon(),
        ],
      ),
      drawer: const SideBar(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const HomePageHeroSection(),
      // : const SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Row(
      //       children: [
      //         HomePageHeroSection(),
      //         HomePageHeroSection(),
      //         HomePageHeroSection(),
      //         HomePageHeroSection(),
      //       ],
      //     ),
      //   ),
    );
  }
}
