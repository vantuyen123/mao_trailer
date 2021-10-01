import 'package:equatable/equatable.dart';
import 'package:mao_trailer/domain/entites/video_entity.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object?> get props => [];
}

class VideosStateInitial extends VideosState {}

class VideosStateLoaded extends VideosState {
  final List<VideoEntity> videos;

  VideosStateLoaded({required this.videos});

  @override
  List<Object?> get props => [videos];
}

class NoVideo extends VideosState {}
