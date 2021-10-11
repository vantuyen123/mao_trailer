import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/data/core/api_constants.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_event.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteList.movieDetail,arguments: MovieDetailArguments(movie.id));
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => MovieDetailScreen(
          //         movieDetailArguments: MovieDetailArguments(movie.id)),
          //   ),
          // );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.w),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: 200.w,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                    DeleteFavoriteMovieEvent(movie.id),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Icon(
                      Icons.delete,
                      size: 30.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
