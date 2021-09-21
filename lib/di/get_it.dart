import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mao_trailer/data/core/dio_client.dart';
import 'package:mao_trailer/data/data_source/movie_remote_data_source.dart';
import 'package:mao_trailer/data/repositories/movie_repository_impl.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/movie/get_coming_soon.dart';
import 'package:mao_trailer/domain/usecases/movie/get_playing_now.dart';
import 'package:mao_trailer/domain/usecases/movie/get_popular.dart';
import 'package:mao_trailer/domain/usecases/movie/get_trending.dart';
import 'package:mao_trailer/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  // Dio:-----------------------------------------------------------------------
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  // DioClient:-----------------------------------------------------------------
  getItInstance
      .registerLazySingleton<DioClient>(() => DioClient(getItInstance()));

  //MovieRemoteDataSource:------------------------------------------------------
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  //MovieRepository:------------------------------------------------------------
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  //GetTrending:----------------------------------------------------------------
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  //GetPopular:-----------------------------------------------------------------
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  //GetComingSoon:--------------------------------------------------------------
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  //GetPlayingNow:--------------------------------------------------------------
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  //MovieCarouselBloc:----------------------------------------------------------
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
    ),
  );
}
