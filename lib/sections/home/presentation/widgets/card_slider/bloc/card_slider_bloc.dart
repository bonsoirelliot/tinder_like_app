import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'card_slider_event.dart';
part 'card_slider_state.dart';

class CardSliderBloc extends Bloc<CardSliderEvent, CardSliderState> {
  final pageController = PageController();

  CardSliderBloc() : super(CardSliderInitial()) {
    on<NextCardSliderEvent>(_onNextCard);
    on<PrevCardSliderEvent>(_onPrevCard);
  }

  void _onNextCard(NextCardSliderEvent event, Emitter<CardSliderState> emit) {
    _animateToPage(pageController.page!.ceil() + 1);
  }

  void _onPrevCard(PrevCardSliderEvent event, Emitter<CardSliderState> emit) {
    _animateToPage(pageController.page!.ceil() - 1);
  }

  void _animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
