import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../movie_detail.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * .02,
        top: context.height * .01,
      ),
      child: SectionWidget(
        title: 'Description',
        content: Flexible(
          child: Text(
            movie.description ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
