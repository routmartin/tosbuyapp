import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../assets/app_styles.dart';
import '../controller/promotion_controller.dart';
import 'widget/promotion_app_bar.dart';
import 'widget/promotion_body.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(
        init: PromotionController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kPrimaryContainerWhiteGray(context: context),
            appBar: const PromotionAppBar(),
            body: PromotionBody(controller: controller),
          );
        });
  }
}
