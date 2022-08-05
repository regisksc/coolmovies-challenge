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
    return Container(
      height: context.height * .36,
      padding: EdgeInsets.symmetric(horizontal: context.width * .02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovieTitle(movie),
          HighlightedInfos(movie),
          Expanded(child: DescriptionBox(movie))
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * .02,
        top: context.height * .01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            'Description',
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Text(
              movie.description ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: context.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
