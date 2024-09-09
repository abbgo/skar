import 'package:equatable/equatable.dart';

class Kategory extends Equatable {
  final String id, nameTM, nameRU;
  final String? image;
  final List<Kategory>? childCategories;
  final String? parentCategoryID;
  final bool? isSelected;

  const Kategory({
    required this.nameTM,
    required this.id,
    required this.nameRU,
    this.image,
    this.childCategories,
    this.parentCategoryID,
    this.isSelected,
  });

  factory Kategory.defaultCategory() {
    return const Kategory(
      id: '',
      nameRU: '',
      nameTM: '',
      image: '',
      isSelected: false,
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
      parentCategoryID: json['parent_category_id'] ?? "",
      isSelected: false,
    );
  }

  Kategory copyWith({
    String? id,
    String? nameTM,
    String? nameRU,
    String? image,
    List<Kategory>? childCategories,
    String? parentCategoryID,
    bool? isSelected,
  }) {
    return Kategory(
      id: id ?? this.id,
      nameTM: nameTM ?? this.nameTM,
      nameRU: nameRU ?? this.nameRU,
      image: image ?? this.image,
      childCategories: childCategories ?? this.childCategories,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, nameTM, nameRU, childCategories];
}

class ResultCategory extends Equatable {
  final List<Kategory>? categories;
  final String error;

  const ResultCategory({
    this.categories,
    required this.error,
  });

  factory ResultCategory.defaultResult() {
    return const ResultCategory(categories: null, error: '');
  }

  @override
  List<Object?> get props => [categories, error];
}
