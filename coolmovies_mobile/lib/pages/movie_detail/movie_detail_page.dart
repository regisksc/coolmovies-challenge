import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../providers/movie_provider.dart';
import 'movie_detail.dart';
import 'widgets/widgets.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.provider}) : super(key: key);
  final MoviesProvider provider;
  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late MovieModel movie;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movie = ModalRoute.of(context)!.settings.arguments! as MovieModel;
    widget.provider.getReviewsForMovieId(movie.id);
    scrollController.addListener(() {
      final pos = scrollController.position;
      if (pos.atEdge && pos.pixels != 0) {
        widget.provider.getReviewsForMovieId(movie.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final provider = context.read<MoviesProvider>();
        provider.resetEditState(movie);
        provider.resetFetchingReviewState();
        provider.lastFetchedPage = 0;
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        body: CustomScrollView(
          controller: scrollController,
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: context.height * .50,
              leading: BackToListButton(movie: movie),
              leadingWidth: context.width * .28,
              flexibleSpace: FlexibleSpaceBar(
                  background: MovieDetailHeader(movie),
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: [
                    MovieDetailInfo(movie),
                    MovieDetailReviews(movie),
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
