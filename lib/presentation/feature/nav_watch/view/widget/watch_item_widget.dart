import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/nav_watch/view/widget/watch_control_overlay.dart';
import 'package:tostinh/presentation/feature/nav_watch/view/widget/watch_video_player.dart';
import 'package:video_player/video_player.dart';

class WatchItemWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  const WatchItemWidget({super.key, required this.videoPlayerController});

  @override
  State<StatefulWidget> createState() => _WatchItemWidget();
}

class _WatchItemWidget extends State<WatchItemWidget> {
  VideoPlayerController get videoPlayerController =>
      widget.videoPlayerController;
  bool isPlaying = false;

  void videoPlayerObserve() {
    if (isPlaying != videoPlayerController.value.isPlaying) {
      isPlaying = videoPlayerController.value.isPlaying;
      Future.delayed(Duration.zero, () async {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void initState() {
    if (!videoPlayerController.value.isInitialized) {
      videoPlayerController.initialize().then((value) => setState(() {}));
    }
    videoPlayerController.addListener(videoPlayerObserve);
    super.initState();
  }

  @override
  void deactivate() async {
    videoPlayerController.pause();
    videoPlayerController.removeListener(videoPlayerObserve);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WatchVideoPlayer(videoPlayerController: videoPlayerController),
        WatchControlOverlay(videoPlayerController: videoPlayerController)
      ],
    );
  }
}
