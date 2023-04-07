import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/nav_watch/controller/watch_controller.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../assets/app_colors.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WatchController>(
      init: WatchController(),
      builder: (controller) {
        return VisibilityDetector(
          key: const Key("Watch"),
          onVisibilityChanged: controller.onVisibilityChanged,
          child: SafeArea(
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  PageView(
                    controller: controller.pageController,
                    scrollDirection: Axis.vertical,
                    onPageChanged: controller.changeWatchPage,
                    children: controller.watchItemsWidget,
                  ),
                  Visibility(
                    visible: controller.isBuffering,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: LinearProgressIndicator(
                        minHeight: 2.sp,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(AppColors.red),
                        backgroundColor: AppColors.whiteGray,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
