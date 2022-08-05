import 'package:flutter/material.dart';

import '../../core/core.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader(
    this.movie, {
    Key? key,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: movie.id,
          child: SizedBox(
            width: context.width,
            height: context.height * .6,
            child: GestureDetector(
              onTap: () => context.pop,
              child: Image.network(
                movie.imgUrl!,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: context.height * .05,
          left: context.width * .05,
          child: SizedBox(
            width: context.width * .28,
            child: MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              textColor: Colors.white,
              elevation: 1,
              highlightElevation: 0,
              onPressed: () => context.pop,
              color: Colors.blueGrey.withOpacity(.3),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: context.width * .04,
                  ),
                  const Spacer(),
                  const Expanded(
                    flex: 13,
                    child: FittedBox(
                      child: Text('more titles'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
