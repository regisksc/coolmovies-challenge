import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'review_tile.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
    required this.review,
  }) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[50],
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: defaultRadius),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: context.height * .3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 12,
              child: _ReviewerRow(reviewerUsername: review.createdBy.name),
            ),
            Expanded(
              flex: 88,
              child: _ReviewContent(review: review),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewerRow extends StatelessWidget {
  const _ReviewerRow({
    Key? key,
    required this.reviewerUsername,
  }) : super(key: key);

  final String reviewerUsername;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "$reviewerUsername's opinion:",
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.blueGrey.shade600,
            ),
          ),
        ),
        Expanded(
          child: ReviewEditButton(onTap: () {
            print("tapped");
          }),
        ),
      ],
    );
  }
}

class _ReviewContent extends StatelessWidget {
  const _ReviewContent({
    Key? key,
    required this.review,
  }) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: defaultRadius.copyWith(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
      ),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Expanded(flex: 17, child: ReviewHeader(review)),
          const Spacer(flex: 2),
          Expanded(flex: 78, child: ReviewBody(review)),
        ],
      ),
    );
  }
}
