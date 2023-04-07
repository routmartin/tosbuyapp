import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WatchVideoPlayer extends StatelessWidget {
  final VideoPlayerController videoPlayerController;
  const WatchVideoPlayer({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return videoPlayerController.value.isInitialized
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: videoPlayerController.value.size.width,
                    height: videoPlayerController.value.size.height,
                    child: VideoPlayer(videoPlayerController),
                  ),
                ),
              ),
            ),
          )
        : Container(
            color: Colors.black,
          );
  }
}
