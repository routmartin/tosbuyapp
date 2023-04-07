import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_app_bar.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () => Get.back(),
      title: AppLocals.storeTitle.tr,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
