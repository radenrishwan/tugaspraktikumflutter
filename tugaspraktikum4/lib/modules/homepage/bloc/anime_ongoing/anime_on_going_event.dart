part of 'anime_on_going_bloc.dart';

abstract class AnimeOnGoingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AnimeOnGoingFetched extends AnimeOnGoingEvent {}
