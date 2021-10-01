import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/entites/video_entity.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';

import '../use_case_base.dart';

class GetVideos extends UserCaseBase<List<VideoEntity>,MovieParams>{
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(MovieParams movieParams) async {
    return await repository.getVideos(movieParams.id);
  }
}