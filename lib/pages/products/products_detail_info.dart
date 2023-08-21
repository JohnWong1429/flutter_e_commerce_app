import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';

class ProductsDetailInfo extends StatefulWidget {
  final ApiProductsDataModelProducts? product;

  const ProductsDetailInfo({
    super.key,
    this.product,
  });

  @override
  State<ProductsDetailInfo> createState() => _ProductsDetailInfoState();
}

class _ProductsDetailInfoState extends State<ProductsDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
