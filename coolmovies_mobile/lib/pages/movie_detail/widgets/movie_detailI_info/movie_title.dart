import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle(this.movie, {Key? key}) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.width * .02),
      child: Column(
        children: [
          Hero(
            tag: "${movie.id}-${movie.title}",
            child: Text(
              movie.title,
              textAlign: TextAlign.left,
              style: context.textTheme.headlineLarge!.copyWith(
                fontSize: context.textTheme.headlineLarge!.fontSize! *
                    (context.screenIsSmall ? .8 : 1),
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
          DefaultTextStyle(
            style: context.textTheme.bodySmall!.copyWith(
              color: Colors.blueGrey.shade800,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.formattedReleaseDate,
                  style: TextStyle(
                    fontSize: context.textTheme.bodySmall!.fontSize! *
                        (context.screenIsSmall ? 1 : 1.2),
                  ),
                ),
                Text(
                  movie.ratingWStar,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.textTheme.bodySmall!.fontSize! * 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
