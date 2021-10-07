 import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class DeleteFavoriteMovie extends UserCaseBase<void,MovieParams>{
  final MovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams params) async {
    return await movieRepository.deleteFavoriteMovie(params.id);
  }

}