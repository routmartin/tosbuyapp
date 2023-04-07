import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';

class NotificationAppBar extends StatelessWidget with PreferredSizeWidget {
  const NotificationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: "Notifications",
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
