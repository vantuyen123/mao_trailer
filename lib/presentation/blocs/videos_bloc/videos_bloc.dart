import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mao_trailer/domain/entites/app_error.dart';
import 'package:mao_trailer/domain/entites/movie_params.dart';
import 'package:mao_trailer/domain/entites/video_entity.dart';
import 'package:mao_trailer/domain/usecases/movie/get_videos.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_event.dart';
import 'package:mao_trailer/presentation/blocs/videos_bloc/videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({required this.getVideos}) : super(VideosStateInitial());

  @override
  Stream<VideosState> mapEventToState(VideosEvent event) async* {
    if (event is LoadVideosEvent) {
      Either<AppError, List<VideoEntity>> eitherResponse =
          await getVideos(MovieParams(event.movieId));

      yield eitherResponse.fold(
        (l) => NoVideo(),
        (r) => VideosStateLoaded(videos: r),
      );
    }
  }
}
