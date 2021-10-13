import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mao_trailer/data/core/dio_client.dart';
import 'package:mao_trailer/data/core/http_client.dart';
import 'package:mao_trailer/data/data_source/authentication_local_data_source.dart';
import 'package:mao_trailer/data/data_source/authentication_remote_data_source.dart';
import 'package:mao_trailer/data/data_source/language_local_data_source.dart';
import 'package:mao_trailer/data/data_source/movie_local_data_source.dart';
import 'package:mao_trailer/data/data_source/movie_remote_data_source.dart';
import 'package:mao_trailer/data/repositories/app_repository_impl.dart';
import 'package:mao_trailer/data/repositories/authentication_repository_impl.dart';
import 'package:mao_trailer/data/repositories/movie_repository_impl.dart';
import 'package:mao_trailer/di/module/network_module.dart';
import 'package:mao_trailer/domain/repositories/app_repository.dart';
import 'package:mao_trailer/domain/repositories/authentication_repository.dart';
import 'package:mao_trailer/domain/repositories/movie_repository.dart';
import 'package:mao_trailer/domain/usecases/authentication/login_user.dart';
import 'package:mao_trailer/domain/usecases/language/get_preferred_language.dart';
import 'package:mao_trailer/domain/usecases/language/update_language.dart';
import 'package:mao_trailer/domain/usecases/movie/check_if_favorite.dart';
import 'package:mao_trailer/domain/usecases/movie/delete_favorite_movie.dart';
import 'package:mao_trailer/domain/usecases/movie/get_cast.dart';
import 'package:mao_trailer/domain/usecases/movie/get_coming_soon.dart';
import 'package:mao_trailer/domain/usecases/movie/get_favorite_movies.dart';
import 'package:mao_trailer/domain/usecases/movie/get_movie_detail.dart';
import 'package:mao_trailer/domain/usecases/movie/get_playing_now.dart';
import 'package:mao_trailer/domain/usecases/movie/get_popular.dart';
import 'package:mao_trailer/domain/usecases/movie/get_search_movies.dart';
import 'package:mao_trailer/domain/usecases/movie/get_trending.dart';
import 'package:mao_trailer/domain/usecases/movie/get_videos.dart';
import 'package:mao_trailer/domain/usecases/movie/save_movie.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:mao_trailer/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:mao_trailer/presentation/blocs/login/login_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_carousel_bloc/movie_carousel_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:mao_trailer/presentation/blocs/search_movies_bloc/search_movie_bloc.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  //Client:---------------------------------------------------------------------
  getItInstance.registerLazySingleton<Client>(() => Client());

  //HttpClient:
  getItInstance
      .registerLazySingleton<HttpClient>(() => HttpClient(getItInstance()));

  // Dio:-----------------------------------------------------------------------
  getItInstance.registerLazySingleton<Dio>(() => NetworkModule.provideDio());

  // DioClient:-----------------------------------------------------------------
  getItInstance
      .registerLazySingleton<DioClient>(() => DioClient(getItInstance()));

  //MovieRemoteDataSource:------------------------------------------------------
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInstance()),
  );

  //MovieLocalDataSource:-------------------------------------------------------
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );

  //MovieRepository:------------------------------------------------------------
  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
            getItInstance(),
          ));

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
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
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

  //GetSearchMovie:-------------------------------------------------------------
  getItInstance.registerLazySingleton<GetSearchMovies>(
      () => GetSearchMovies(getItInstance()));

  //SearchMovieBloc:------------------------------------------------------------
  getItInstance
      .registerFactory(() => SearchMovieBloc(searchMovies: getItInstance()));

  //SaveMovie:------------------------------------------------------------------
  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  //checkIfFavorite:------------------------------------------------------------
  getItInstance.registerLazySingleton<CheckIfFavorite>(
      () => CheckIfFavorite(getItInstance()));

  //getFavoriteMovies:----------------------------------------------------------
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getItInstance()));

  //deleteFavoriteMovie:--------------------------------------------------------
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));

  //FavoriteBloc:---------------------------------------------------------------
  getItInstance.registerFactory(
    () => FavoriteBloc(
      saveMovie: getItInstance(),
      getFavoriteMovies: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      checkIfFavorite: getItInstance(),
    ),
  );

  //LanguageLocalDataSource:----------------------------------------------------
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  //AppRepository:--------------------------------------------------------------
  getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(getItInstance()));

  //UpdateLanguage:-------------------------------------------------------------
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(getItInstance()));

  //getPreferredLanguage:-------------------------------------------------------
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(getItInstance()));

  //LanguageBloc:---------------------------------------------------------------
  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc(
    getPreferredLanguage: getItInstance(),
    updateLanguage: getItInstance(),
  ));

  ///Authentication:------------------------------------------------------------

  //AuthenticationRemoteDataSource:---------------------------------------------
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  //AuthenticationLocalDataSource:----------------------------------------------
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  //AuthenticationRepository:---------------------------------------------------
  getItInstance.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(getItInstance(), getItInstance()));

  //GetLogin:-------------------------------------------------------------------
  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  //LoginBLoc:------------------------------------------------------------------
  getItInstance
      .registerSingleton<LoginBloc>(LoginBloc(loginUser: getItInstance()));
}
