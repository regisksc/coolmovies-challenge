import 'package:equatable/equatable.dart';

import '../core.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
  });
  factory UserModel.fromJson(JSON json) {
    return UserModel(
      name: json['name'] as String,
      id: json['id'] as String,
    );
  }

  final String id;
  final String name;

  JSON get toJson {
    return {"id": id, "name": name};
  }

  @override
  List<Object?> get props => [id, name];
}
