import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ReviewEditButton extends StatelessWidget {
  const ReviewEditButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(7),
          child: Card(
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
        ),
      ],
    );
  }
}
