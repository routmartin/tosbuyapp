import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MyOrderController controller;
  const MyOrderAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: AppLocals.myOrder.tr,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
