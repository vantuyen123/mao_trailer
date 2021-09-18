import 'movie_model.dart';

class MoviesResultModel {
  MoviesResultModel({
    required this.movies,
  });

  late final List<MovieModel> movies;

  MoviesResultModel.fromJson(Map<String, dynamic> json) {
    movies = List.from(json['results'])
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = movies.map((e) => e.toJson()).toList();
    return _data;
  }
}
