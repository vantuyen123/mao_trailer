import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/cast_entity.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/usecases/movie/get_cast.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_event.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;

  CastBloc({required this.getCast}) : super(CastStateInitial());

  @override
  Stream<CastState> mapEventToState(CastEvent event) async* {
    if (event is LoadCastEvent) {
      Either<AppError, List<CastEntity>> eitherResponse =
          await getCast(MovieParams(event.movieId));
      yield eitherResponse.fold(
        (l) => CastStateError(),
        (r) => CastStateLoaded(casts: r),
      );
    }
  }
}
