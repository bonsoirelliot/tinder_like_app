import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:meta/meta.dart';

part 'card_slider_event.dart';
part 'card_slider_state.dart';

class CardSliderBloc extends Bloc<CardSliderEvent, CardSliderState> {
  final pageController = LoopPageController();

  CardSliderBloc() : super(CardSliderInitial()) {
    on<NextCardSliderEvent>(_onNextCard);
    on<PrevCardSliderEvent>(_onPrevCard);
  }

  void _onNextCard(NextCardSliderEvent event, Emitter<CardSliderState> emit) {
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _onPrevCard(PrevCardSliderEvent event, Emitter<CardSliderState> emit) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}
