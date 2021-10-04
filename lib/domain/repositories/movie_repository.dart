import 'package:dartz/dartz.dart';
import 'package:mao_trailer/data/models/movie_model.dart';
import 'package:mao_trailer/data/models/video_model.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/cast_entity.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';

abstract class MovieRepository {
  //Home Screen:----------------------------------------------------------------
  Future<Either<AppError, List<MovieModel>>> getTrending();

  Future<Either<AppError, List<MovieModel>>> getPopular();

  Future<Either<AppError, List<MovieModel>>> getPlaying();

  Future<Either<AppError, List<MovieModel>>> getComingSoon();

  //Movie Detail:---------------------------------------------------------------
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);

  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);

  Future<Either<AppError, List<VideoModel>>> getVideos(int id);

  //Search:---------------------------------------------------------------------
  Future<Either<AppError,List<MovieModel>>> getSearchMovies(String searchTerm);

  //LocalDataBase:--------------------------------------------------------------
  Future<Either<AppError,void>> saveMovie(MovieEntity movieEntity);

  Future<Either<AppError,List<MovieEntity>>> getFavoriteMovies();

  Future<Either<AppError,void>> deleteFavoriteMovie(int movieId);

  Future<Either<AppError,bool>> checkIfMovieFavorite(int movieId);


}
