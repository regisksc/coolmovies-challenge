import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../list_movies.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final ValueListenable<List<MovieModel>> movies;

  @override
  Widget build(BuildContext context) {
    final spacing = context.width * .1;
    return ValueListenableBuilder(
      valueListenable: movies,
      builder: (context, value, child) {
        return SizedBox(
          width: context.width,
          height: context.height * .6,
          child: ListView.separated(
            itemCount: movies.value.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, __) => SizedBox(width: spacing),
            itemBuilder: (BuildContext context, int index) {
              final movie = movies.value[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: context.height * .02),
                margin: EdgeInsets.only(
                    bottom: context.height * .03,
                    left: index == 0 ? spacing : 0,
                    right: index >= movies.value.length - 1 ? spacing : 0),
                child: MovieListTile(movie),
              );
            },
          ),
        );
      },
    );
  }
}
