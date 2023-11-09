import 'package:flutter/material.dart';
import 'package:tinder_like_app/const/theme/styles.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/person.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Name',
                style: AppStyles.h1,
              ),
              const Text(
                'Company',
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
    );
  }
}
