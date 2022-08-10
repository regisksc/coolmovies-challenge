// ignore_for_file: leading_newlines_in_multiline_strings

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../../../providers/providers.dart';
import '../list_movies.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .85);
    _pageController.addListener(_currentPageListener);
  }

  void _currentPageListener() =>
      setState(() => _currentPage = _pageController.page ?? 0);

  double _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final spacing = context.width * .1;
    final containerHeight = context.height * .65;
    return Consumer<MoviesProvider>(
      builder: (_, provider, __) {
        return Column(
          children: [
            SizedBox(
              width: context.width,
              height: containerHeight,
              child: Builder(builder: (context) {
                if (widget.movies.isEmpty) {
                  const loader = CircularProgressIndicator.adaptive();
                  return const Center(child: loader);
                }
                return PageView.builder(
                  controller: _pageController,
                  itemCount: widget.movies.length,
                  // pageSnapping: false,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = widget.movies[index];
                    final vertPad = context.height * .02;
                    final pageMovementMultiplier = index - _currentPage + 1;
                    final translate =
                        containerHeight * (1.05 - pageMovementMultiplier).abs();
                    return Transform(
                      transform: Matrix4.identity()
                        ..scale(-pageMovementMultiplier * .5)
                        ..translate(-1.1, translate)
                        ..setRotationX(pi * 2 * pageMovementMultiplier)
                        ..setRotationY(pi / 10 * pageMovementMultiplier)
                        ..setRotationZ((-pi / 160) * pageMovementMultiplier)
                        ..setEntry(3, 1, 0.0001),
                      child: Column(
                        children: [
                          Container(
                            key: const Key('movieTile'),
                            padding: EdgeInsets.symmetric(vertical: vertPad),
                            child: MovieListTile(movie),
                          ),
                          SizedBox(width: spacing),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Visibility(
              visible: provider.lastRequestFailure != null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.width * .2),
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
    );
  }
}
