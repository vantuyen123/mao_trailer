
import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class MovieBackdropEvent extends Equatable{
  const MovieBackdropEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent{
  final MovieEntity movie;

  const MovieBackdropChangedEvent({required this.movie});

  @override
  // TODO: implement props
  List<Object?> get props => [movie];


}