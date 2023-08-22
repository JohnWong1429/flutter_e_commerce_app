import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_e_commerce_app/models/api_products_data_model.dart';
import 'package:my_e_commerce_app/widgets/rating.dart';

import '../../widgets/products_info_title.dart';

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
  double dicountedPrice(int price, double discount) {
    final newPrice = price * ((100 - discount) / 100);
    return newPrice;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: CarouselSlider(
                items: widget.product?.images?.map((e) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Image.network(e),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 9 / 16,
                  viewportFraction: 0.75,
                  initialPage: 0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 20,
              ),
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.product?.title ?? 'Product Title',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const ProductsInfoTitle(
                    title: 'description',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Flexible(
                    child: Text(
                      widget.product?.description ?? "Product Desc.",
                      style: TextStyle(
                        height: 2,
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  if (widget.product?.brand != null) ...[
                    const ProductsInfoTitle(
                      title: 'brand',
                      width: 58,
                      bgColor: Color.fromARGB(255, 230, 119, 111),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      widget.product!.brand!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                  if (widget.product?.category != null) ...[
                    const ProductsInfoTitle(
                      title: 'category',
                      width: 84,
                      bgColor: Color.fromARGB(255, 233, 158, 227),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${widget.product!.category![0].toUpperCase()}${widget.product!.category!.substring(1)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ],
                  const ProductsInfoTitle(
                    title: 'stock',
                    width: 56,
                    bgColor: Color.fromARGB(255, 245, 221, 135),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product?.stock != null && widget.product!.stock! > 0
                        ? widget.product!.stock!.toString()
                        : 'Out of Stock',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Rating(
                        rating: widget.product?.rating ?? 0,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        widget.product?.rating?.toStringAsFixed(1) ?? '0',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        widget.product?.discountPercentage == null ? 14 : 26,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: widget.product?.discountPercentage == null
                        ? Row(
                            children: [
                              Text(
                                'USD ${widget.product?.price?.toStringAsFixed(2) ?? '9999'}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'USD ${widget.product?.price?.toStringAsFixed(2) ?? '9999'}',
                                style: TextStyle(
                                  fontSize: 20,
                                  height: 0.5,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 1.5,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                'USD ${(dicountedPrice(widget.product?.price ?? 9999, widget.product!.discountPercentage!)).toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[600],
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
