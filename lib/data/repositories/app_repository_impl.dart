import 'package:dartz/dartz.dart';
import 'package:mao_trailer/data/data_source/language_local_data_source.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository {

  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try{
        final response = await languageLocalDataSource.updateLanguage(language);
        return Right(response);
    }on Exception{
      return Left(AppError(AppErrorType.database));
    }
  }

}