import 'package:equatable/equatable.dart';

class Favorite extends Equatable {
  final String id;
  final int type;

  const Favorite({required this.id, required this.type});

  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type};
  }

  @override
  List<Object?> get props => [id, type];
}
