import 'package:dartz/dartz.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';

abstract class UserCaseBase<Type,Params>{
  Future<Either<AppError,Type>> call(Params params);
}