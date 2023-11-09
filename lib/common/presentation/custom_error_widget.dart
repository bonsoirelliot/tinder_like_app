import 'package:flutter/material.dart';
import 'package:tinder_like_app/const/theme/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.error,
    this.onPressed,
    super.key,
  });

  final Exception error;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error.toString(),
          style: AppStyles.h1,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Обновить'),
        ),
      ],
    );
  }
}
