import 'package:equatable/equatable.dart';

abstract class VideosEvent extends Equatable{
  const VideosEvent();
}

class LoadVideosEvent extends VideosEvent{
  final int movieId;

  LoadVideosEvent({required this.movieId});
  @override
  List<Object?> get props => [movieId];

}
