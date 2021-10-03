import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class SearchMovieState extends Equatable{
  const SearchMovieState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchMovieInitial extends SearchMovieState{}

class SearchMovieLoaded extends SearchMovieState{

  final List<MovieEntity> movies;

  SearchMovieLoaded(this.movies);

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class SearchMovieLoading extends SearchMovieState{}

class SearchMovieError extends SearchMovieState{
  final AppErrorType errorType;

  SearchMovieError(this.errorType);

  @override
  // TODO: implement props
  List<Object?> get props => [errorType];
}