import 'package:equatable/equatable.dart';
import 'package:skar/models/brend.dart';
import 'package:skar/models/product_color.dart';
import 'package:skar/models/shop.dart';

class Product {
  final String id, nameTM, nameRU;
  final String? image, brendID;
  final num? price, oldPrice;
  final List<ProductColor>? productColors;
  final Brend? brend;
  final Shop? shop;

  Product({
    required this.id,
    required this.nameTM,
    required this.nameRU,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.productColors,
    this.brendID,
    this.brend,
    this.shop,
  });

  factory Product.defaultProduct() {
    return Product(
      id: '',
      nameRU: '',
      nameTM: '',
      image: '',
      price: null,
      oldPrice: null,
      productColors: [],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'] ?? "",
      price: json['price'],
      oldPrice: json['old_price'] ?? 0,
      productColors: json['product_colors'] == null
          ? []
          : List<ProductColor>.from(
              json['product_colors'].map(
                (productJson) => ProductColor.fromJson(productJson),
              ),
            ),
      brendID: json['brend_id'] ?? "",
      brend: json['brend'] == null
          ? Brend.defaultBrend()
          : Brend.fromJson(json['brend']),
      shop: json['shop'] == null
          ? Shop.defaultShop()
          : Shop.fromJson(json['shop']),
    );
  }
}

class ResultProduct extends Equatable {
  final List<Product>? products;
  final Product? product;
  final String error;

  const ResultProduct({
    this.products,
    this.product,
    required this.error,
  });

  factory ResultProduct.defaultResult() {
    return const ResultProduct(
      products: null,
      product: null,
      error: '',
    );
  }

  @override
  List<Object?> get props => [
        products,
        product,
        error,
      ];
}
