
import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/repositories/app_repository.dart';
import 'package:mao_trailer/domain/usecases/use_case_base.dart';

class UpdateLanguage extends UserCaseBase<void,String>{

  final AppRepository appRepository;

  UpdateLanguage(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await appRepository.updateLanguage(params);
  }


}