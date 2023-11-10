import 'package:flutter/material.dart';
import 'package:tinder_like_app/const/theme/styles.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';

class UserCardInfoWidget extends StatelessWidget {
  const UserCardInfoWidget({
    required this.model,
    super.key,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          model.name,
          style: AppStyles.h1,
        ),
        Text(
          model.company.name,
          style: AppStyles.h3,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          model.toBulletList(),
          style: AppStyles.h3.copyWith(
            color: Colors.black.withOpacity(.6),
          ),
        ),
      ],
    );
  }
}
