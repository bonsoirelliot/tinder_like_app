import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:tinder_like_app/common/presentation/custom_error_widget.dart';
import 'package:tinder_like_app/sections/home/bloc/home_bloc.dart';
import 'package:tinder_like_app/sections/home/data/models/user/user_model.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_slider/presentation/card_slider_widget.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_switcher_widget.dart';
import 'package:tinder_like_app/sections/home/services/users_load_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc(usersLoadService: UsersLoadService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: homeBloc,
          builder: (_, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeError) {
              return CustomErrorWidget(
                error: state.error,
                onPressed: () => homeBloc.add(HomeLoadUsersEvent()),
              );
            }

            return _Body(
              users: (state as HomeSuccess).users,
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    required this.users,
    super.key,
  });

  final List<UserModel> users;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final controller = LoopPageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: CardSliderWidget(
            users: widget.users,
            controller: controller,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 6,
          ),
          child: CardSwitcherWidget(
            onLeftArrowPressed: () => controller.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            ),
            onRightArrowPressed: () => controller.previousPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            ),
          ),
        ),
      ],
    );
  }
}
