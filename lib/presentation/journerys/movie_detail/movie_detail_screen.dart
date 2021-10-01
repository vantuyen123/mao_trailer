import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/di/get_it.dart';
import 'package:mao_trailer/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_event.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_state.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_bloc.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/movie_detail_arguments.dart';
import 'package:mao_trailer/presentation/journerys/movie_detail/videos_widget.dart';

import 'big_poster.dart';
import 'cast_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _videosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc)
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        TranslationConstants.CAST.t(context).toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(
                      videosBloc: _videosBloc
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
