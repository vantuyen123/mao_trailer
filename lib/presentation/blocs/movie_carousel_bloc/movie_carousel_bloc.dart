import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/usecases/movie/get_trending.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_event.dart';

import 'movie_carousel_event.dart';
import 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {required this.movieBackdropBloc, required this.getTrending})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold((l) => MovieCarouselError(), (movies) {
        movieBackdropBloc.add(MovieBackdropChangedEvent(movie: movies[event.defaultIndex]));
        return MovieCarouselLoaded(
          movies: movies,
          defaultIndex: event.defaultIndex,
        );
      });
    }
  }
}
