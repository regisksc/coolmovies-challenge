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
      backgroundColor: Colors.blueGrey.shade100,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: context.height * .50,
            leading: const BackToListButton(),
            leadingWidth: context.width * .28,
            flexibleSpace: FlexibleSpaceBar(
              background: MovieDetailHeader(movie),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    MovieDetailInfo(movie),
                    MovieDetailReviews(movie),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
