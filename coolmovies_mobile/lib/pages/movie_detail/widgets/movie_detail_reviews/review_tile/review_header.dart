import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader(
    this.review, {
    Key? key,
  }) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(left: context.width * .02),
          height: context.height * .05,
          width: context.width * .6,
          child: Text(
            review.title,
            maxLines: 2,
            style: context.textTheme.labelLarge!.copyWith(
              fontSize: context.textTheme.labelLarge!.fontSize! * 1.1,
              color: Colors.blueGrey.shade600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(flex: 3),
        Center(
          child: Text(
            review.ratingWStar,
            style: context.textTheme.labelLarge!.copyWith(
              color: Colors.blueGrey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
