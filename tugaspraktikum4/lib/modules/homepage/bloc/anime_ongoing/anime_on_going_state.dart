part of 'anime_on_going_bloc.dart';

class AnimeOnGoingState extends Equatable {
  final List<Anime> animes;
  final bool hasReachedMax;
  final int page;

  const AnimeOnGoingState({this.animes = const [], this.hasReachedMax = false, this.page = 0});

  AnimeOnGoingState copyWith({required List<Anime> animes, required bool hasReachedMax, required int page}) {
    return AnimeOnGoingState(
      animes: animes,
      hasReachedMax: hasReachedMax,
      page: page,
    );
  }

  @override
  List<Object> get props => [animes, hasReachedMax, page];
}
