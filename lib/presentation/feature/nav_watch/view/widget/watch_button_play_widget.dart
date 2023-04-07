import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/feature/nav_watch/controller/watch_button_play_controller.dart';
import 'package:video_player/video_player.dart';

class WatchButtonPlayWidget extends StatelessWidget {
  final String tag;
  final VideoPlayerController videoPlayerController;

  WatchButtonPlayWidget(
      {Key? key, required this.tag, required this.videoPlayerController})
      : super(key: key) {
    Get.put(WatchButtonPlayController(), tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WatchButtonPlayController>(
      tag: tag,
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.execute(videoPlayerController: videoPlayerController);
          },
          behavior: HitTestBehavior.translucent,
          child: Visibility(
            visible: !videoPlayerController.value.isPlaying &&
                videoPlayerController.value.isInitialized,
            child: SvgPicture.asset(
              AppIcons.play,
              width: 90.sp,
              height: 90.sp,
              fit: BoxFit.none,
            ),
          ),
        );
      },
    );
  }
}
