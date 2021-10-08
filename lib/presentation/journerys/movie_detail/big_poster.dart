import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/extensions/num_extensions.dart';
import 'package:mao_trailer/data/core/api_constants.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

import 'movie_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ])),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubTitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: 16.w,
          right: 16.w,
          top:   ScreenUtil().statusBarHeight + 12.h,
          child: MovieDetailAppBar(
            movieDetailEntity: movie,
          ),
        )
      ],
    );
  }
}
