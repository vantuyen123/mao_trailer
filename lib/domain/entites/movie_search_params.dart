import 'package:equatable/equatable.dart';

class MovieSearchParams extends Equatable{
  final String searchTerm;

  MovieSearchParams({required this.searchTerm});

  @override
  // TODO: implement props
  List<Object?> get props => [searchTerm];
}