import 'package:mao_trailer/domain/entites/movie_entity.dart';

class MovieModel extends MovieEntity {

  late final int id;
  late final bool? video;
  late final int voteCount;
  late final double voteAverage;
  late final String? title;
  late final String releaseDate;
  late final String? originalLanguage;
  late final String? originalTitle;
  late final String backdropPath;
  late final List<int> genreIds;
  late final bool? adult;
  late final String? overview;
  late final String posterPath;
  late final double popularity;
  late final String mediaType;

  MovieModel({
    required this.releaseDate,
    required this.id,
    required this.backdropPath,
    required this.genreIds,
    required this.voteCount,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.adult,
    required this.overview,
    required this.popularity,
    required this.mediaType,
  }) : super(
    id: id,
    title: title,
    backdropPath: backdropPath,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
    overview: overview
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
    releaseDate : json['release_date'],
    id : json['id'],
    backdropPath : json['backdrop_path']?? "",
    genreIds : json['genre_ids'].cast<int>(),
    voteCount : json['vote_count'],
    originalLanguage : json['original_language'],
    originalTitle : json['original_title'],
    posterPath : json['poster_path'],
    title : json['title'],
    video : json['video'],
    voteAverage : json['vote_average']?.toDouble() ?? 0.0,
    adult : json['adult'],
    overview : json['overview'],
    popularity : json['popularity']?.toDouble() ?? 0.0,
    mediaType : json['media_type']?? ""
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['release_date'] = releaseDate;
    _data['id'] = id;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['vote_count'] = voteCount;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['poster_path'] = posterPath;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['adult'] = adult;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['media_type'] = mediaType;
    return _data;
  }
}
