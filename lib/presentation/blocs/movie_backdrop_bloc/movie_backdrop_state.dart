import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class MovieBackdropState extends Equatable{
  const MovieBackdropState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState{

}

class MovieBackdropChanged extends MovieBackdropState{
  final MovieEntity movie;

  const MovieBackdropChanged(this.movie);

  @override
  // TODO: implement props
  List<Object?> get props => [movie];
}