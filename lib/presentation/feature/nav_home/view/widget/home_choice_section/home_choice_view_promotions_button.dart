import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../controller/home_controller.dart';
import 'home_choice_view_layout_button.dart';

class HomeChoiceViewPromotionsButton extends StatelessWidget {
  final HomeController controller;
  const HomeChoiceViewPromotionsButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeChoiceViewLayoutButton(
      title: "Promotions",
      subTitle: "10 items",
      icon: AppIcons.promotion,
      topColor: 0xffFFBA2A,
      bottomColor: 0xffFFAD03,
      onPressed: () => Get.toNamed(AppRoutes.promotion),
    );
  }
}
