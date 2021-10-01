import 'package:mao_trailer/data/models/video_model.dart';

class VideoResultModel {

  late final int id;
  late final List<VideoModel> videos;

  VideoResultModel({
    required this.id,
    required this.videos,
  });
  VideoResultModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    videos = List.from(json['results']).map((e)=>VideoModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['results'] = videos.map((e)=>e.toJson()).toList();
    return _data;
  }
}

