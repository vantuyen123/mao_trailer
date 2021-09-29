import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/usecases/movie/get_coming_soon.dart';
import 'package:mao_trailer/domain/usecases/movie/get_playing_now.dart';
import 'package:mao_trailer/domain/usecases/movie/get_popular.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_state.dart';

import 'movie_tabbed_event.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabbedInitial(currentTabIndex: 0));

  @override
  Stream<MovieTabbedState> mapEventToState(MovieTabbedEvent event) async* {
    if (event is MovieTabbedChangedEvent) {
      Either<AppError, List<MovieEntity>>? movieEither;
      switch (event.currentTabIndex) {
        case 0:
          movieEither = await getPopular(NoParams());
          break;
        case 1:
          movieEither = await getPlayingNow(NoParams());
          break;
        case 2:
          movieEither = await getComingSoon(NoParams());
          break;
      }
      yield movieEither!.fold(
        (l) => MovieTabLoadError(
          currentTabIndex: event.currentTabIndex,
          errorType: l.appErrorType,
        ),
        (movie) {
          return MovieTabChanged(
            movies: movie,
            currentTabIndex: event.currentTabIndex,
          );
        },
      );
    }
  }
}
