import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/payment/controller/payment_controller.dart';

import 'widget/payment_app_bar.dart';
import 'widget/payment_body.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) => Scaffold(
        appBar: const PaymentAppBar(),
        body: PaymentBody(controller: controller),
      ),
    );
  }
}
