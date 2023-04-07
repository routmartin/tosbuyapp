import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class PaymentMethodAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PaymentMethodAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: AppLocals.paymentSelectTitle.tr,
      onTapLeft: () => Get.back(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
