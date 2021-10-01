import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mao_trailer/common/constant/translation_constrains.dart';
import 'package:mao_trailer/common/extensions/string_extensions.dart';
import 'package:mao_trailer/domain/entites/video_entity.dart';
import 'package:mao_trailer/presentation/journerys/watch_video/watch_video_argument.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({
    Key? key,
    required this.watchVideoArguments,
  }) : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    _videos = widget.watchVideoArguments.videos;
    _youtubeController = YoutubePlayerController(
        initialVideoId: _videos[0].key,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          forceHD: true,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConstants.WATCHTRAILERS.t(context).toString(),
        ),
      ),
      body: YoutubePlayerBuilder(
        builder: (context, player) {
          return Column(
            children: [
              player,
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < _videos.length; i++)
                      Container(
                        height: 60.h,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _youtubeController.load(_videos[i].key);
                                _youtubeController.play();
                              },
                              child: Container(
                                child: CachedNetworkImage(
                                  width: 150.w,
                                  height: 120.h,
                                  imageUrl: YoutubePlayer.getThumbnail(
                                      videoId: _videos[i].key,
                                      quality: ThumbnailQuality.high),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Text(
                                  _videos[i].title,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ))
            ],
          );
        },
        player: YoutubePlayer(
          controller: _youtubeController,
        ),
      ),
    );
  }
}
