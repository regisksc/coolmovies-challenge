import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'movie_detailI_info.dart';

class MovieDetailInfo extends StatelessWidget {
  const MovieDetailInfo({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final hightlightedInformations = [
      {
        "title": "release",
        "value": movie.formattedReleaseDate,
      },
      {
        "title": "director",
        "value": movie.directorName,
      },
      {
        "title": "rated",
        "value": "⭐ ${movie.rating}",
      },
    ];
    return Container(
      height: context.height * .3,
      padding: EdgeInsets.symmetric(horizontal: context.width * .02),
      child: Column(
        children: [
          MovieTitle(movie),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: hightlightedInformations
                .map((e) => HighlightedInfoBlock(
                    title: e["title"]!, value: e["value"]!))
                .toList(),
          ),
        ],
      ),
    );
  }
}
