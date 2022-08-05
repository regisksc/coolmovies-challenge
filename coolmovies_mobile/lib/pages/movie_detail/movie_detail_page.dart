import 'package:flutter/material.dart';

import '../../core/core.dart';
import 'movie_detail.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments! as MovieModel;
    debugPrint(movie.title);
    return Scaffold(
      body: Column(
        children: [
          MovieDetailHeader(movie),
        ],
      ),
    );
  }
}
