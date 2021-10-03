import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/entites/movie_search_params.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class GetSearchMovies extends UserCaseBase<List<MovieEntity>,MovieSearchParams>{
  final MovieRepository repository;

  GetSearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(MovieSearchParams params) async {
    return await repository.getSearchMovies(params.searchTerm);
  }

}