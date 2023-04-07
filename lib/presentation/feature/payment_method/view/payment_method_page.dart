import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/payment_method_controller.dart';
import 'widget/payment_method_app_bar.dart';
import 'widget/payment_method_body.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      init: PaymentMethodController(),
      builder: (controller) => Scaffold(
        appBar: const PaymentMethodAppBar(),
        body: PaymentMethodBody(controller: controller),
      ),
    );
  }
}
