// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../core.dart';

class MovieReviewModel extends Equatable {
  MovieReviewModel({
    required this.id,
    required this.title,
    required this.body,
    required this.rating,
    required this.createdBy,
  });

  factory MovieReviewModel.fromJson(JSON json) {
    return MovieReviewModel(
      title: json['title'] as String,
      body: json['body'] as String,
      rating: json['rating'] as int,
      createdBy: UserModel.fromJson(
        json["userByUserReviewerId"] as JSON,
      ),
      id: json['id'] as String,
    );
  }

  String get ratingWStar => "⭐ $rating";

  final String id;
  final String title;
  final String body;
  final int rating;
  final UserModel createdBy;
  bool isInEditState = false;

  JSON get toJson {
    return {
      "body": body,
      "title": title,
      "rating": rating,
      "userByUserReviewerId": createdBy,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      body,
      rating,
      createdBy,
    ];
  }

  MovieReviewModel copyWith({
    String? title,
    String? body,
    int? rating,
  }) {
    return MovieReviewModel(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      rating: rating ?? this.rating,
      createdBy: createdBy,
    );
  }

  @override
  bool get stringify => true;
}
