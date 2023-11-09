import 'package:flutter/material.dart';

/// Переключатель карточек
class CardSwitcherWidget extends StatelessWidget {
  const CardSwitcherWidget({
    this.onLeftArrowPressed,
    this.onRightArrowPressed,
    super.key,
  });

  final VoidCallback? onLeftArrowPressed;
  
  final VoidCallback? onRightArrowPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onLeftArrowPressed,
          icon: const Icon(Icons.chevron_left_rounded),
        ),
        const SizedBox(
          width: 100,
        ),
        IconButton(
          onPressed: onRightArrowPressed,
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ],
    );
  }
}
