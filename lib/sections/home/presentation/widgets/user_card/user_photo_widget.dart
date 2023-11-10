import 'package:flutter/material.dart';

class UserPhotoWidget extends StatelessWidget {
  const UserPhotoWidget({
    required this.photo,
    this.onPressed,
    super.key,
  });

  final String photo;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          photo,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * .7,
        ),
      ),
    );
  }
}
