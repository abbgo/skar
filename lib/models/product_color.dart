class ProductColor {
  final String id;
  final String? name;
  final List<dynamic>? images;
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
      images: json['images'] ?? [],
      dimensions: json['dimensions'] ?? [],
    );
  }
}
