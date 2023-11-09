import 'package:flutter/material.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_switcher_widget.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/user_card/user_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Слайдер с карточками пользователей
            Flexible(
              child: PageView.builder(
                itemBuilder: (_, i) => const UserCardWidget(),
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
              ),
            ),

            /// Переключатель карточек
            const Padding(
              padding:  EdgeInsets.only(
                top: 24,
                bottom: 6,
              ),
              child: CardSwitcherWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
