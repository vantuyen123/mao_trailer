import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/usecases/movie/get_movie_detail.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_event.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_event.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_event.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_state.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_bloc.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;
  MovieDetailBloc({
    required this.castBloc,
    required this.getMovieDetail,
    required this.videosBloc,
    required this.favoriteBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      );
      
      favoriteBloc.add(CheckIfFavoriteMovieEvent(event.movieId));
      
      castBloc.add(LoadCastEvent(movieId: event.movieId));

      videosBloc.add(LoadVideosEvent(movieId: event.movieId));
    }
  }
}
