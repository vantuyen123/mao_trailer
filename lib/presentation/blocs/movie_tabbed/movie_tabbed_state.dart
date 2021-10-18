import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({required this.currentTabIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  final int currentTabIndex;

  MovieTabbedInitial({required this.currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity>? movies;

  MovieTabChanged({this.movies, required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  const MovieTabLoadError(
      {required int currentTabIndex, required this.errorType})
      : super(currentTabIndex: currentTabIndex);
}

class MovieTabLoading extends MovieTabbedState {
  const MovieTabLoading({required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
}
