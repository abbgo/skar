class Brend {
  final String? name;
  final String? image;

  Brend({
    required this.name,
    this.image,
  });

  factory Brend.fromJson(Map<String, dynamic> json) {
    return Brend(
      name: json['name'],
      image: json['image'] ?? "",
    );
  }

  factory Brend.defaultBrend() {
    return Brend(
      name: '',
      image: '',
    );
  }
}
