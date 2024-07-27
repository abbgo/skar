class ProductColor {
  final String id;
  final String? name;
  final List<ProductColorImage>? images;
  final List<dynamic>? dimensions;

  ProductColor({
    required this.id,
    this.name,
    this.images,
    this.dimensions,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      id: json['id'],
      name: json['name'] ?? "",
      images: json['image'] == null
          ? []
          : List<ProductColorImage>.from(
              json['images'].map(
                (reponseJson) => ProductColorImage.fromJson(reponseJson),
              ),
            ),
      dimensions: json['dimensions'] ?? [],
    );
  }
}

class ProductColorImage {
  String image;

  ProductColorImage({required this.image});

  factory ProductColorImage.fromJson(Map<String, dynamic> json) {
    return ProductColorImage(image: json['image']);
  }
}
