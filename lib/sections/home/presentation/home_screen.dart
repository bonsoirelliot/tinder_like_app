import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_like_app/common/presentation/custom_error_widget.dart';
import 'package:tinder_like_app/sections/home/bloc/home_bloc.dart';
import 'package:tinder_like_app/sections/home/data/models/user_model.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_slider/bloc/card_slider_bloc.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_slider/presentation/card_slider_widget.dart';
import 'package:tinder_like_app/sections/home/presentation/widgets/card_switcher_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cardSliderBloc = CardSliderBloc();
  final homeBloc = HomeBloc();

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

            return BlocProvider(
              create: (_) => cardSliderBloc,
              child: _Body(
                users: (state as HomeSuccess).users,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.users,
    super.key,
  });

  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: CardSliderWidget(
            users: users,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 6,
          ),
          child: CardSwitcherWidget(
            onLeftArrowPressed: () =>
                context.read<CardSliderBloc>().add(PrevCardSliderEvent()),
            onRightArrowPressed: () =>
                context.read<CardSliderBloc>().add(NextCardSliderEvent()),
          ),
        ),
      ],
    );
  }
}
