import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/no_params.dart';
import 'package:mao_trailer/domain/repositories/app_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class GetPreferredLanguage extends UserCaseBase<String, NoParams>{
   final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }

}