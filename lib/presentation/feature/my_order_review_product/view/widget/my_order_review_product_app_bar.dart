import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';

class MyOrderReviewProductAppBar extends StatelessWidget
    with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      onTapLeft: () {
        Get.back();
      },
      title: "Review Product",
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
