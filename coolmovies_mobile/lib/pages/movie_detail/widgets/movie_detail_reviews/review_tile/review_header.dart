import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/core.dart';
import '../../../../../providers/providers.dart';

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
          child: Consumer<MoviesProvider>(
            builder: (_, provider, __) {
              return review.isInEditState
                  ? TextFormField(
                      initialValue: review.title,
                      maxLines: 10,
                      onChanged: (editValue) => review.title = editValue,
                      autofocus: true,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )
                  : Text(
                      review.title,
                      maxLines: 2,
                      style: context.textTheme.labelLarge!.copyWith(
                        fontSize: context.textTheme.labelLarge!.fontSize! * 1.1,
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    );
            },
          ),
        ),
        const Spacer(flex: 3),
        Consumer<MoviesProvider>(
          builder: (_, provider, __) {
            return Center(
              child: review.isInEditState
                  ? DropdownButton<int>(
                      hint: Text('${review.rating}   ⭐'),
                      items: List<DropdownMenuItem<int>>.generate(
                        5,
                        (i) => DropdownMenuItem(
                          value: i + 1,
                          child: Text('${i + 1}   ⭐'),
                        ),
                      ),
                      onChanged: (value) => review.rating = value!)
                  : Text(
                      review.ratingWStar,
                      style: context.textTheme.labelLarge!.copyWith(
                        color: Colors.blueGrey.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            );
          },
        ),
        const Spacer(),
      ],
    );
  }
}
