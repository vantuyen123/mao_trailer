import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/data/core/api_constants.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_arguments.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key? key,
    required this.movieId,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        elevation: 32,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteList.movieDetail,
              arguments: MovieDetailArguments(movieId),
            );
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => MovieDetailScreen(
            //       movieDetailArguments: MovieDetailArguments(movieId),
            //     ),
            //   ),
            // );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
