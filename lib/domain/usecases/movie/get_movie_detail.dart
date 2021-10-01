import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class GetMovieDetail extends UserCaseBase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
