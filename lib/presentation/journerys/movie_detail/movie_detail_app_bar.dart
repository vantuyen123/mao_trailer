import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/domain/entites/movie_detail_entity.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_event.dart';
import 'package:mao_trailer/presentation/blocs/favorite/favorite_state.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const MovieDetailAppBar({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25.sp,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, snapshot) {
          if (snapshot is IsFavoriteMovie) {
            return GestureDetector(
              onTap: () => BlocProvider.of<FavoriteBloc>(context)
                  .add(ToggleFavoriteMovieEvent(
                MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                snapshot.isMovieFavorite,
              )),
              child: Icon(
                snapshot.isMovieFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
                size: 25.sp,
              ),
            );
          } else {
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 25.sp,
            );
          }
        }),
      ],
    );
  }
}
