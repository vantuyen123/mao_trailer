
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/presentation/journerys/favorite/favorite_screen.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_arguments.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_screen.dart';
import 'package:mao_trailer/presentation/journerys/watch_video/watch_video_argument.dart';
import 'package:mao_trailer/presentation/journerys/watch_video/watch_videos_screen.dart';

import 'journerys/home/home_screen.dart';
import 'journerys/login/login_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.home: (context) => HomeScreen(),
        RouteList.initial: (context) => LoginScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
            movieDetailArguments: settings.arguments as MovieDetailArguments),
        RouteList.watchTrailer: (context) => WatchVideoScreen(
            watchVideoArguments: settings.arguments as WatchVideoArguments),
        RouteList.favorite: (context) => FavoriteScreen()
      };
}
