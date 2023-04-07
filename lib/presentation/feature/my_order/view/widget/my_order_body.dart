import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';
import 'package:tostinh/presentation/feature/my_order/view/widget/my_order_order_list_section/my_order_order_list_section.dart';

class MyOrderBody extends StatelessWidget {
  const MyOrderBody({Key? key, required this.controller}) : super(key: key);
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryContainerWhiteGray(context: context),
      child: MyOrderOrderListSection(
        controller: controller,
      ),
    );
  }
}
