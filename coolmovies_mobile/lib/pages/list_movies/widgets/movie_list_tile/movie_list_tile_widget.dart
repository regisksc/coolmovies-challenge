import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'movie_list_tile.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final movieImageSize = width * .8;
    return Container(
      height: movieImageSize,
      width: movieImageSize,
      decoration: BoxDecoration(
        color: const Color(0xfffdfdfd),
        borderRadius: defaultRadius,
      ),
      child: Card(
        elevation: 20,
        shadowColor: Colors.grey.shade700,
        shape: RoundedRectangleBorder(borderRadius: defaultRadius),
        child: Stack(
          children: [
            MovieListTileBackground(movie, movieImageSize),
            MovieListTileForeground(movie),
          ],
        ),
      ),
    );
  }
}