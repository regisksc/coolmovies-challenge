import 'package:flutter/material.dart';

import '../../../core/core.dart';

class MovieDetailReviews extends StatelessWidget {
  const MovieDetailReviews(
    this.movie, {
    Key? key,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * .02),
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: context.width * .02,
          top: context.height * .01,
        ),
        child: Text(
          'Reviews',
          style: context.textTheme.headlineMedium,
        ),
      ),
    );
  }
}
