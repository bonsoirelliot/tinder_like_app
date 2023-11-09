import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_like_app/sections/home/data/models/user_model.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_slider/bloc/card_slider_bloc.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_card_widget.dart';

/// Слайдер с карточками пользователей
class CardSliderWidget extends StatelessWidget {
  const CardSliderWidget({
    required this.users,
    super.key,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (_, i) => UserCardWidget(
        model: users[i],
      ),
      onPageChanged: (i) {},
      itemCount: users.length,
      physics: const BouncingScrollPhysics(),
      controller: context.read<CardSliderBloc>().pageController,
    );
  }
}
