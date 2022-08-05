import 'package:flutter/material.dart';

import '../../core/core.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments! as MovieModel;
    debugPrint(movie.title);
    return Scaffold(appBar: AppBar());
  }
}
