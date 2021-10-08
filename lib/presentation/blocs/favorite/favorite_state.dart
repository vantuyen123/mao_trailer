import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMovieLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  FavoriteMovieLoaded(this.movies);

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class FavoriteMovieError extends FavoriteState{}

class IsFavoriteMovie extends FavoriteState{
  final bool isMovieFavorite;

  IsFavoriteMovie(this.isMovieFavorite);

  @override
  // TODO: implement props
  List<Object?> get props => [isMovieFavorite];
}
