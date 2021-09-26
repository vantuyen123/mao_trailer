import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_tabbe/movie_tabbed_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieTabCardWidget(
            movieId: movie.id,
            title: movie.title!,
            posterPath: movie.posterPath,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 14.w,
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
