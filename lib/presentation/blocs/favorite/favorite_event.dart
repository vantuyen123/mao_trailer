import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class FavoriteEvent extends Equatable{
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavoriteMovieEvent extends FavoriteEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeleteFavoriteMovieEvent extends FavoriteEvent{
  final int movieId;

  DeleteFavoriteMovieEvent(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteEvent{
  final MovieEntity movieEntity;
  final bool isFavorite;

  ToggleFavoriteMovieEvent(this.movieEntity, this.isFavorite);

  @override
  // TODO: implement props
  List<Object?> get props => [movieEntity,isFavorite];
}

class CheckIfFavoriteMovieEvent extends FavoriteEvent{
  final int movieId;

  CheckIfFavoriteMovieEvent(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}