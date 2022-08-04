import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class ListMoviesPageHeader extends StatelessWidget {
  const ListMoviesPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const userName = 'Friend';
    final greetingFont = context.textTheme.headlineMedium!.copyWith(
      fontSize: context.textTheme.headlineMedium!.fontSize! * .7,
      color: Colors.grey.shade400,
    );
    final highlightedGreetingFont = greetingFont.copyWith(
      color: Colors.grey.shade200,
      fontSize: greetingFont.fontSize! * 1.25,
      fontWeight: FontWeight.bold,
    );
    return Card(
      elevation: 20,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: defaultRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade900,
          borderRadius: defaultRadius.copyWith(
            bottomLeft: Radius.zero,
            topLeft: Radius.zero,
          ),
        ),
        width: context.width * .7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * .05,
                vertical: context.height * .03,
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Hello ',
                  style: greetingFont,
                  children: [
                    TextSpan(
                        text: userName.toString(),
                        style: highlightedGreetingFont),
                    TextSpan(
                      text: " !",
                      style: greetingFont,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(flex: 35),
                Expanded(
                  flex: 65,
                  child: Text(
                    'how about watching something today?',
                    textAlign: TextAlign.right,
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
