part of 'anime_complete_bloc.dart';

class AnimeCompleteState extends Equatable {
  final List<Anime> animes;
  final bool hasReachedMax;
  final int page;

  const AnimeCompleteState({this.animes = const [], this.hasReachedMax = false, this.page = 0});

  AnimeCompleteState copyWith({required List<Anime> animes, required bool hasReachedMax, required int page}) {
    return AnimeCompleteState(
      animes: animes,
      hasReachedMax: hasReachedMax,
      page: page,
    );
  }

  @override
  List<Object> get props => [animes, hasReachedMax, page];
}
