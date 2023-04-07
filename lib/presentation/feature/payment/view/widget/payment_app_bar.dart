import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class PaymentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PaymentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: AppLocals.paymentTitle.tr,
      onTapLeft: () => Get.back(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
