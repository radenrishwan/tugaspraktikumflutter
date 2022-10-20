import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:otakudesu/data/models/web//anime.dart';
import 'package:otakudesu/data/repository/anime_repository.dart';

part 'anime_on_going_event.dart';
part 'anime_on_going_state.dart';

class AnimeOnGoingBloc extends Bloc<AnimeOnGoingEvent, AnimeOnGoingState> {
  AnimeOnGoingBloc() : super(const AnimeOnGoingState()) {
    on<AnimeOnGoingFetched>((event, emit) async {
      final result = await AnimeRepository().findOnGoingAnime(state.page);

      if (state.hasReachedMax) {
        return;
      }

      if (result.isEmpty) {
        emit(state.copyWith(animes: [...state.animes, ...result], hasReachedMax: true, page: state.page + 1));
      } else {
        emit(state.copyWith(animes: [...state.animes, ...result], hasReachedMax: false, page: state.page + 1));
      }
    });
  }
}
