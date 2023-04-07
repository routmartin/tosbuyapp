import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order/view/widget/my_order_app_bar.dart';

import '../controller/my_order_controller.dart';
import 'widget/my_order_body.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderController>(
      init: MyOrderController(),
      builder: (controller) {
        return Scaffold(
          appBar: MyOrderAppBar(
            controller: controller,
          ),
          body: MyOrderBody(
            controller: controller,
          ),
        );
      },
    );
  }
}
