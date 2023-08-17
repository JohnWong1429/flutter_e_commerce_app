import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_mode.dart';
import 'package:provider/provider.dart';

class ProductsProvider extends ChangeNotifier implements ReassembleHandler {
  ApiProductsDataModel? _allProducts;

  ApiProductsDataModel? get allProducts => _allProducts;
  set allProducts(ApiProductsDataModel? value) {
    _allProducts = value;
    notifyListeners();
  }

  @override
  void reassemble() {
    // Did hot-reload
  }
}


// {
//   "products": [
//     {
//       "id": 1,
//       "title": "iPhone 9",
//       "description": "An apple mobile which is nothing like apple",
//       "price": 549,
//       "discountPercentage": 12.96,
//       "rating": 4.69,
//       "stock": 94,
//       "brand": "Apple",
//       "category": "smartphones",
//       "thumbnail": "...",
//       "images": ["...", "...", "..."]
//     },
//     {...},
//     {...},
//     {...}
//     // 30 items
//   ],

//   "total": 100,
//   "skip": 0,
//   "limit": 30
// }