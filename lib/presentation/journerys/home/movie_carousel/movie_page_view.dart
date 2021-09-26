import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/domain/entites/movie_entity.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_backdrop_bloc/movie_backdrop_event.dart';
import 'package:mao_trailer/presentation/journerys/home/movie_carousel/animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key? key,
    required this.movies,
    required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      height: ScreenUtil().screenHeight * 0.35,
      child: PageView.builder(
          controller: _pageController,
          pageSnapping: true,
          itemCount: widget.movies.length > 0 ? widget.movies.length : 0,
          onPageChanged: (index) {
            BlocProvider.of<MovieBackdropBloc>(context)
                .add(MovieBackdropChangedEvent(movie: widget.movies[index]));
          },
          itemBuilder: (context, index) {
            final MovieEntity movie = widget.movies[index];
            return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieId: movie.id,
              posterPath: movie.posterPath,
            );
          }),
    );
  }
}
