import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_app_bar.dart';

import 'widget/my_order_details_body.dart';

class MyOrderDetailsPage extends StatelessWidget {
  const MyOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderDetailsController>(
      init: MyOrderDetailsController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: MyOrderDetailsAppBar(
          controller: controller,
        ),
        body: MyOrderDetailsBody(
          controller: controller,
        ),
      ),
    );
  }
}
