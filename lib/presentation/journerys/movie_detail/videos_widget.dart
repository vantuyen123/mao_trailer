import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/common/constant/route_constants.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/presentation/blocs/movie_detail_bloc/movie_detail_state.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_bloc.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_state.dart';
import 'package:mao_trailer/presentation/journerys/watch_video/watch_video_argument.dart';
import 'package:mao_trailer/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key? key,
    required this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosStateLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: TranslationConstants.WATCHTRAILERS,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.watchTrailer,arguments: WatchVideoArguments(_videos));

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => WatchVideoScreen(
              //       watchVideoArguments: WatchVideoArguments(_videos),
              //     ),
              //   ),
              // );
            },
          );
        } else if (state is MovieDetailError) {
          return Container();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
