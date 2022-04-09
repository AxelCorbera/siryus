import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget{
  final VideoPlayerController controller;

  const VideoPlayerWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.removeListener(() { });
    controller.setLooping(false);
    return Center(
      child: controller.value.isInitialized
          ? Container(
        height: MediaQuery.of(context).size.width/1.6,
            width: MediaQuery.of(context).size.width/1.6,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
      ),
          )
          : Container(),
    );
  }



}
