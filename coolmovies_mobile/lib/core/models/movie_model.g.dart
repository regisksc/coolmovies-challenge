// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String,
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String?,
      releaseDate: json['releaseDate'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'releaseDate': instance.releaseDate,
    };
