import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_layout_button.dart';

class HomeChoiceViewCategoriesButton extends StatelessWidget {
  final HomeController controller;
  const HomeChoiceViewCategoriesButton({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeChoiceViewLayoutButton(
      title: "Categories",
      subTitle: "10 items",
      icon: AppIcons.category,
      topColor: 0xffFC691C,
      bottomColor: 0xffFA5818,
      onPressed: () {
        Get.toNamed(AppLocals.category);
      },
    );
  }
}
