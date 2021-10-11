import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/data/core/api_constants.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_arguments.dart';
import 'package:mao_trailer/presentation/themes/theme_text.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteList.movieDetail,arguments: MovieDetailArguments(movie.id),);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => MovieDetailScreen(
        //       movieDetailArguments: MovieDetailArguments(movie.id),
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  width: 80.w,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    movie.title.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview.toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
