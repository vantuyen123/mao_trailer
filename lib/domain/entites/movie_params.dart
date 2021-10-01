import 'package:equatable/equatable.dart';

class MovieParams extends Equatable{
  final int id;

  MovieParams(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}