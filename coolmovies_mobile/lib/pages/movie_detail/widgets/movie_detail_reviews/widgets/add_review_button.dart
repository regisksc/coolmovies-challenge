import 'package:flutter/material.dart';

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.05),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add_box_rounded),
      ),
    );
  }
}
