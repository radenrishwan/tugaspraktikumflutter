part of 'anime_complete_bloc.dart';

abstract class AnimeCompleteEvent extends Equatable {
  const AnimeCompleteEvent();

  @override
  List<Object> get props => [];
}

class AnimeCompleteFetched extends AnimeCompleteEvent {}
