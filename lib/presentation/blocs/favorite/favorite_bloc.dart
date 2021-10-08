import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/usecases/movie/check_if_favorite.dart';
import 'package:mao_trailer/domain/usecases/movie/delete_favorite_movie.dart';
import 'package:mao_trailer/domain/usecases/movie/get_favorite_movies.dart';
import 'package:mao_trailer/domain/usecases/movie/save_movie.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_event.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavorite checkIfFavorite;

  FavoriteBloc(
      {required this.saveMovie,
      required this.getFavoriteMovies,
      required this.deleteFavoriteMovie,
      required this.checkIfFavorite})
      : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleFavoriteMovieEvent) {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response = await checkIfFavorite(MovieParams(event.movieEntity.id));

      yield response.fold(
        (l) => FavoriteMovieError(),
        (r) => IsFavoriteMovie(r),
      );
    } else if (event is LoadFavoriteMovieEvent) {
      yield* _fetchLoadFavoriteMovies();
    } else if (event is DeleteFavoriteMovieEvent) {
      await deleteFavoriteMovie(MovieParams(event.movieId));
      yield* _fetchLoadFavoriteMovies();
    } else if (event is CheckIfFavoriteMovieEvent) {
      final response = await checkIfFavorite(MovieParams(event.movieId));
      yield response.fold(
        (l) => FavoriteMovieError(),
        (r) => IsFavoriteMovie(r),
      );
    }
  }

  Stream<FavoriteState> _fetchLoadFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());

    yield response.fold(
      (l) => FavoriteMovieError(),
      (r) => FavoriteMovieLoaded(r),
    );
  }
}
