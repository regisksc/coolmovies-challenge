import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody(this.review, {Key? key}) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * .05),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                review.body,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.blueGrey.shade600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
