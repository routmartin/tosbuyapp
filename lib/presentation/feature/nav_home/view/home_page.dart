import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_body.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return VisibilityDetector(
          key: const Key("Home"),
          onVisibilityChanged: controller.onVisibilityChanged,
          child: Container(
            color: kPrimaryContainerWhiteGray(context: context),
            child: CustomRequestIndicator(
              controller: controller.requestIndicatorController,
              onLoad: controller.requestFirstProduct,
              child: HomeBody(controller: controller),
            ),
          ),
        );
      },
    );
  }
}
