class ApiProductsDataModel {
  final List<ApiProductsDataModelProducts>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ApiProductsDataModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ApiProductsDataModel.fromJson(Map<String, dynamic> json) {
    return ApiProductsDataModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              ApiProductsDataModelProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class ApiProductsDataModelProducts {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<dynamic>? images;

  ApiProductsDataModelProducts({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ApiProductsDataModelProducts.fromJson(Map<String, dynamic> json) {
    return ApiProductsDataModelProducts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      discountPercentage: json['discountPercentage'] as double?,
      rating: (json['rating']).toDouble() as double?,
      stock: json['stock'] as int?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images: json['images'] as List<dynamic>?,
    );
  }
}
