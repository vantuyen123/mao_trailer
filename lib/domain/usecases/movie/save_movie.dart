import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class SaveMovie extends UserCaseBase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
