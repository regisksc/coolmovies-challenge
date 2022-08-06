import 'package:flutter/material.dart';

import '../../../core/core.dart';

class HighlightedInfos extends StatelessWidget {
  const HighlightedInfos(
    this.movie, {
    Key? key,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final hightlightedInformations = [
      {
        "title": "release",
        "value": movie.formattedReleaseDate,
      },
      {
        "title": "director",
        "value": movie.directorName,
      },
      {
        "title": "rated",
        "value": movie.ratingWStar,
      },
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: hightlightedInformations
          .map((e) =>
              HighlightedInfoBlock(title: e["title"]!, value: e["value"]!))
          .toList(),
    );
  }
}

class HighlightedInfoBlock extends StatelessWidget {
  const HighlightedInfoBlock({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final fontMultiplier = value.contains("⭐") ? 1.5 : 1;
    return DefaultTextStyle.merge(
      style: context.textTheme.bodySmall!.copyWith(
        letterSpacing: 1,
        color: Colors.blueGrey.shade600,
      ),
      child: Container(
        padding: EdgeInsets.only(top: context.height * .01),
        height: context.width * .15,
        width: context.width * .3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(
              value,
              style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.blueGrey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      context.textTheme.bodySmall!.fontSize! * fontMultiplier),
            ),
          ],
        ),
      ),
    );
  }
}