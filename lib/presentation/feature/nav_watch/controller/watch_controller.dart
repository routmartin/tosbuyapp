import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/response/feed_response.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../view/widget/watch_item_widget.dart';

class WatchController extends GetxController {
  final feedResponse = FeedResponse(feeds: [
    Feed(
        index: 1,
        isEnablePlay: true,
        url:
            "https://d2cqvl54b1gtkt.cloudfront.net/PRODUCTION/5d85da3fa81ada4c66211a07/media/post/video/1662101858300-1b3aba00-2cc0-4ede-b205-50cc04fa3680/1662101858300-b795293573702f50bc28bf57f0c3d05d75324da6806ab24.mp4"),
    Feed(
        index: 2,
        isEnablePlay: false,
        url:
            "https://d2cqvl54b1gtkt.cloudfront.net/PRODUCTION/5d85da3fa81ada4c66211a07/media/post/video/1662101815046-78b0afc1-01e1-471c-87f4-da994010787f/1662101815046-20c86d34e681f73c14c6476074852424405b6dc31712a7f4945.mp4")
  ]);

  final pageController = PageController();
  List<WatchItemWidget> watchItemsWidget = [];
  late VideoPlayerController videoPlayerController;
  bool isBuffering = true;

  void videoPlayerObserve() {
    if (isBuffering != videoPlayerController.value.isBuffering) {
      isBuffering = videoPlayerController.value.isBuffering;
      update();
    }
    if (videoPlayerController.value.isInitialized) {
      if (videoPlayerController.value.duration.inMilliseconds ==
          videoPlayerController.value.position.inMilliseconds) {
        pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.linear);
      }
    }
  }

  void changeWatchPage(int index) {
    for (var element in watchItemsWidget) {
      final videoPlayerController = element.videoPlayerController;
      if (videoPlayerController.value.isInitialized) {
        videoPlayerController.seekTo(const Duration(seconds: 0));
        videoPlayerController.removeListener(videoPlayerObserve);
      }
    }
    videoPlayerController = watchItemsWidget[index].videoPlayerController;
    if (!videoPlayerController.value.isInitialized) {
      videoPlayerController.initialize();
      videoPlayerController.play();
    } else {
      videoPlayerController.play();
    }
    videoPlayerController.addListener(videoPlayerObserve);
  }

  void _initialPlayer() {
    final playerControllers = feedResponse.feeds.map((e) {
      return VideoPlayerController.network(e.url);
    }).toList();
    watchItemsWidget = playerControllers
        .map((e) => WatchItemWidget(videoPlayerController: e))
        .toList();
    videoPlayerController = watchItemsWidget.first.videoPlayerController;
  }

  void _addEventPlayer() {
    watchItemsWidget.first.videoPlayerController
        .addListener(videoPlayerObserve);
  }

  ///When visibleFraction equal 1 it's mean this page have full visible
  ///If equal 0 it's mean this page is pause or navigate to another page.
  void onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 0) {
      videoPlayerController.pause();
    }
  }

  @override
  void onInit() {
    _initialPlayer();
    super.onInit();
  }

  @override
  void onReady() {
    _addEventPlayer();
    super.onReady();
  }
}
