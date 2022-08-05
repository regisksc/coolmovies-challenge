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
