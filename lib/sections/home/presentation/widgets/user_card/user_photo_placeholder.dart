import 'package:flutter/material.dart';

class UserPhotoPlaceholder extends StatelessWidget {
  const UserPhotoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black45,
        ),
      ),
    );
  }
}
