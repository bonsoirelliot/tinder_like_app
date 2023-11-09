part of 'card_slider_bloc.dart';

@immutable
sealed class CardSliderEvent {}

class NextCardSliderEvent extends CardSliderEvent {}

class PrevCardSliderEvent extends CardSliderEvent {}
