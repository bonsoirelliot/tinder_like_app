import 'package:flutter/material.dart';

class CardSwitcherWidget extends StatelessWidget {
  const CardSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        const SizedBox(
          width: 100,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }
}
