import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class GetTrending extends UserCaseBase<List<MovieEntity>,NoParams>{
  final MovieRepository repository;

  GetTrending(this.repository);

  Future<Either<AppError,List<MovieEntity>>> call(NoParams noParams) async
  => await repository.getTrending();

}