import 'package:flutter/material.dart';
import 'package:tinder_like_app/const/theme/styles.dart';
import 'package:tinder_like_app/sections/home/data/models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.model,
    super.key,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/person.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .7,
              ),
            ),
            Column(
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
                  'Description' * 50,
                  style: AppStyles.h3.copyWith(
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
