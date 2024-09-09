import 'package:equatable/equatable.dart';

class Shop {
  final String? id, nameTM, nameRU, addressTM, addressRU;
  final String? image;
  final double? latitude, longitude;
  final List<dynamic>? phones;
  final bool? hasShipping;
  final bool? isShoppingCenter;
  final Shop? parentShop;
  final bool? atHome;

  const Shop({
    this.id,
    this.nameRU,
    this.nameTM,
    this.latitude,
    this.longitude,
    this.image,
    this.addressTM,
    this.addressRU,
    this.phones,
    this.hasShipping,
    this.isShoppingCenter,
    this.parentShop,
    this.atHome,
  });

  factory Shop.defaultShop() {
    return const Shop(
      id: '',
      nameRU: '',
      nameTM: '',
      latitude: 0,
      longitude: 0,
      image: '',
      addressTM: '',
      addressRU: '',
      phones: [],
      hasShipping: false,
      isShoppingCenter: false,
      parentShop: null,
      atHome: null,
    );
  }

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'] ?? '',
      nameRU: json['name_ru'] ?? '',
      nameTM: json['name_tm'] ?? '',
      latitude: json['latitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      image: json['image'] ?? "",
      addressTM: json['address_tm'] ?? "",
      addressRU: json['address_ru'] ?? "",
      phones: json['phones'] ?? [],
      hasShipping: json['has_shipping'] ?? false,
      isShoppingCenter: json['is_shopping_center'] ?? false,
      parentShop: json['parent_shop'] == null
          ? Shop.defaultShop()
          : Shop.fromJson(json['parent_shop']),
      atHome: json['at_home'] ?? false,
    );
  }
}

class ResultShop extends Equatable {
  final List<Shop>? shops;
  final Shop? shop;
  final String error;

  const ResultShop({this.shops, this.shop, required this.error});

  factory ResultShop.defaultResult() {
    return const ResultShop(shops: null, shop: null, error: '');
  }

  @override
  List<Object?> get props => [shops, shop, error];
}
