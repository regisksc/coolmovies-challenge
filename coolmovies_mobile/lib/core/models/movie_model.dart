import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel({
    required this.title,
    required this.id,
    this.imgUrl,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> get toJson => _$MovieModelToJson(this);

  String id;
  String title;
  String? imgUrl;
  String? releaseDate;
}
