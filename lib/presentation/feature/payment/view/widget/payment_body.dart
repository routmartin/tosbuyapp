import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/payment_controller.dart';
import 'payment_address_section/payment_address_section.dart';
import 'payment_amount_section/payment_amount_section.dart';
import 'payment_method_section/payment_method_section.dart';
import 'payment_pay_section/payment_pay_section.dart';
import 'payment_remark_section/payment_remark_section.dart';

class PaymentBody extends StatelessWidget {
  final PaymentController controller;

  const PaymentBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                PaymentAddressSection(controller: controller),
                PaymentMethodSection(controller: controller),
                PaymentAmountSection(controller: controller),
                const PaymentRemarkSection(),
                SizedBox(height: 10.sp)
              ],
            ),
          ),
        ),
        const PaymentPaySection(),
      ],
    );
  }
}
