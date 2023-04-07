import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class MyOrderDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final MyOrderDetailsController controller;
  const MyOrderDetailsAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: AppLocals.myOrderDetails.tr,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
