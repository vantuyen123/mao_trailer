import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mao_trailer/data/core/dio_client.dart';
import 'package:mao_trailer/data/data_source/movie_remote_data_source.dart';
import 'package:mao_trailer/data/repositories/movie_repository_impl.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/movie/get_cast.dart';
import 'package:mao_trailer/domain/usecases/movie/get_coming_soon.dart';
import 'package:mao_trailer/domain/usecases/movie/get_movie_detail.dart';
import 'package:mao_trailer/domain/usecases/movie/get_playing_now.dart';
import 'package:mao_trailer/domain/usecases/movie/get_popular.dart';
import 'package:mao_trailer/domain/usecases/movie/get_trending.dart';
import 'package:mao_trailer/domain/usecases/movie/get_videos.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_bloc.dart';

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
      movieBackdropBloc: getItInstance(),
    ),
  );

  //MovieBackdropBloc:----------------------------------------------------------
  getItInstance.registerLazySingleton(() => MovieBackdropBloc());

  //MovieTabbedBloc:------------------------------------------------------------
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance(),
    ),
  );

  //LanguageBloc:---------------------------------------------------------------
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  //GetMovieDetail:-------------------------------------------------------------
  getItInstance.registerLazySingleton<GetMovieDetail>(
    () => GetMovieDetail(
      getItInstance(),
    ),
  );

  //MovieDetailBloc:------------------------------------------------------------
  getItInstance.registerFactory(
    () => MovieDetailBloc(
        castBloc: getItInstance(),
        getMovieDetail: getItInstance(),
        videosBloc: getItInstance()),
  );

  //GetCast:--------------------------------------------------------------------
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  //CastBloc:-------------------------------------------------------------------
  getItInstance.registerFactory(() => CastBloc(getCast: getItInstance()));

  //GetVideo:-------------------------------------------------------------------
  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  //VideosBloc:-----------------------------------------------------------------
  getItInstance.registerFactory(() => VideosBloc(getVideos: getItInstance()));
}
