import 'package:flutter/material.dart';

import '../../../core/core.dart';

class BackToListButton extends StatelessWidget {
  const BackToListButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
