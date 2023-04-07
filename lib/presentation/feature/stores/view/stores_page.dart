import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../assets/app_styles.dart';
import '../controller/store_controller.dart';
import 'widget/store_app_bar.dart';
import 'widget/store_body.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
        init: StoreController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kPrimaryContainerWhiteGray(context: context),
            appBar: const StoreAppBar(),
            body: StoreBody(
              controller: controller,
            ),
          );
        });
  }
}
