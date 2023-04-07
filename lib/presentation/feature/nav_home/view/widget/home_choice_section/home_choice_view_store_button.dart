import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_layout_button.dart';
import 'package:tostinh/routes/app_routes.dart';

class HomeChoiceViewStoreButton extends StatelessWidget {
  final HomeController controller;
  const HomeChoiceViewStoreButton({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeChoiceViewLayoutButton(
      title: "Store",
      subTitle: "10 items",
      icon: AppIcons.storeFill,
      topColor: 0xff3DABFF,
      bottomColor: 0xff2597ED,
      onPressed: () {
        Get.toNamed(AppRoutes.store);
      },
    );
  }
}
