// ignore_for_file: leading_newlines_in_multiline_strings

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../providers/providers.dart';
import '../list_movies.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    final spacing = context.width * .1;
    return SizedBox(
      width: context.width,
      height: context.height * .65,
      child: Consumer<MoviesProvider>(
        builder: (_, provider, __) {
          final movies = provider.movies;
          return movies.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: ListView.separated(
                        itemCount: movies.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, __) =>
                            SizedBox(width: spacing),
                        itemBuilder: (BuildContext context, int index) {
                          final movie = movies[index];
                          return Container(
                            key: const Key('movieTile'),
                            padding: EdgeInsets.symmetric(
                              vertical: context.height * .02,
                            ),
                            margin: EdgeInsets.only(
                              bottom: context.height * .03,
                              left: index == 0 ? spacing : 0,
                              right: index >= movies.length - 1 ? spacing : 0,
                            ),
                            child: MovieListTile(movie),
                          );
                        },
                      ),
                    ),
                    if (provider.lastRequestFailure == null)
                      const Offstage()
                    else
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.width * .2),
                          child: AutoSizeText(
                            """a problem occured when fetching movies. you might be seeing results from storage.""",
                            minFontSize: 8,
                            maxFontSize: 14,
                            style: context.textTheme.labelSmall!.copyWith(
                              fontSize: context.width * .03,
                              color: Colors.redAccent.withOpacity(.4),
                            ),
                          ),
                        ),
                      )
                  ],
                );
        },
      ),
    );
  }
}
