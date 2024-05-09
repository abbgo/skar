import 'package:equatable/equatable.dart';

class Kategory extends Equatable {
  final String id, nameTM, nameRU;
  final String? image;
  final List<Kategory>? childCategories;

  const Kategory({
    required this.nameTM,
    required this.id,
    required this.nameRU,
    this.image,
    this.childCategories,
  });

  factory Kategory.defaultCategory() {
    return const Kategory(
      id: '',
      nameRU: '',
      nameTM: '',
      image: '',
    );
  }

  factory Kategory.fromJson(Map<String, dynamic> json) {
    return Kategory(
      id: json['id'],
      nameTM: json['name_tm'],
      nameRU: json['name_ru'],
      image: json['image'] ?? "",
      childCategories: json['child_categories'] == null
          ? []
          : List<Kategory>.from(
              json['child_categories'].map(
                (dataJson) => Kategory.fromJson(dataJson),
              ),
            ),
    );
  }

  @override
  List<Object?> get props => [id, nameTM, nameRU, childCategories];
}
