import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_card_widget.dart';

/// Слайдер с карточками пользователей
class CardSliderWidget extends StatelessWidget {
  const CardSliderWidget({
    required this.users,
    required this.controller,
    super.key,
  });

  final List<UserModel> users;

  final LoopPageController controller;

  @override
  Widget build(BuildContext context) {
    return LoopPageView.builder(
      itemBuilder: (_, i) => UserCardWidget(
        model: users[i],
      ),
      itemCount: users.length,
      physics: const BouncingScrollPhysics(),
      controller: controller,
    );
  }
}
