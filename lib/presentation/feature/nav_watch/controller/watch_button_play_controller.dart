import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WatchButtonPlayController extends GetxController
    with GetTickerProviderStateMixin {
  void execute({required VideoPlayerController videoPlayerController}) {
    final isPlaying = videoPlayerController.value.isPlaying;
    if (isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    update();
  }
}
