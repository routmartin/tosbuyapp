import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/store_detail/view/widget/store_detail_body.dart';

import '../../../../assets/app_styles.dart';
import '../controller/store_detail_controller.dart';
import 'widget/store_detail_app_bar.dart';

class StoreDetailPage extends StatelessWidget {
  const StoreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreDetailController>(
        init: StoreDetailController(),
        builder: (controller) {
          return DefaultTabController(
            initialIndex: 1,
            length: 3,
            child: Scaffold(
              backgroundColor: kPrimaryContainerWhiteGray(context: context),
              appBar: StoreDetailAppBar(controller: controller),
              body: StoreDetailBody(controller: controller),
            ),
          );
        });
  }
}
