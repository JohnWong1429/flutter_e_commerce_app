import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';
import 'package:my_e_commerce_app/pages/home/home_page_hero_section.dart';
import 'package:my_e_commerce_app/pages/products/products_page.dart';
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
    if (context.read<ProductsProvider>().products.length < 8) {
      _fetchSingleProduct(List<int>.generate(8, (index) => index + 1));
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RIW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            letterSpacing: 4,
            fontWeight: FontWeight.w900,
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
          : SingleChildScrollView(
              child: Column(
                children: [
                  const HomePageHeroSection(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ProductsPage.routeName);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blueAccent,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          overlayColor: MaterialStateProperty.all(
                            Colors.grey,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                          ),
                        ),
                        child: const Text(
                          'START SHOPPING',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
      backgroundColor: const Color.fromARGB(255, 247, 240, 225),
    );
  }
}
