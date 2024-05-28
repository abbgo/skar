class Favorite {
  final String id;
  final int type;

  Favorite({required this.id, required this.type});

  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type};
  }
}
