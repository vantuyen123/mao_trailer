import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable{
  const MovieDetailState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState{}

class MovieDetailLoading extends MovieDetailState{}

class MovieDetailError extends MovieDetailState{}

class MovieDetailLoaded extends MovieDetailState{

  final MovieDetailEntity movieDetailEntity;

  const MovieDetailLoaded(this.movieDetailEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [movieDetailEntity];
}