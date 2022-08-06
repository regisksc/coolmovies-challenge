import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
    required this.review,
  }) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * .03),
      height: context.height * .25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 20, child: _TitleRow(review)),
          Expanded(
            flex: 80,
            child: Container(
              color: Colors.blue[50],
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.width * .05,
                      ),
                      child: Text(
                        review.body,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow(
    this.review, {
    Key? key,
  }) : super(key: key);

  final MovieReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _titlePortion(context),
        SizedBox(width: context.width * .02),
        Visibility(
          visible: false,
          child: Expanded(child: _editPortion(context)),
        ),
      ],
    );
  }

  Widget _titlePortion(BuildContext context) {
    return SizedBox(
      height: context.height * .05,
      width: context.width * .6,
      child: Text(
        "${review.title} ${review.title} ${review.title}",
        maxLines: 2,
        style: context.textTheme.labelLarge!.copyWith(
          color: Colors.blueGrey.shade600,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _editPortion(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          review.ratingWStar,
          style: context.textTheme.labelLarge!.copyWith(
            color: Colors.blueGrey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Card(
          color: Colors.black12,
          child: Container(
            height: context.height * .03,
            width: context.width * .15,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'edit',
                  style: context.textTheme.labelSmall!.copyWith(
                    fontSize: context.width * .028,
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(width: context.width * .01),
                Icon(
                  Icons.edit,
                  color: Colors.white60,
                  size: MediaQuery.of(context).size.shortestSide * .03,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
