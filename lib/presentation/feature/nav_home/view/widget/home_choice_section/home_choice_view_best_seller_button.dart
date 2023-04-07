import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';
import 'package:tostinh/presentation/feature/nav_home/view/widget/home_choice_section/home_choice_view_layout_button.dart';

class HomeChoiceViewBestSellerButton extends StatelessWidget {
  final HomeController controller;
  const HomeChoiceViewBestSellerButton({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeChoiceViewLayoutButton(title: "Best Seller", subTitle: "10 items",icon: AppIcons.bestSeller, topColor: 0xffFD51C1, bottomColor: 0xffFF34B1, onPressed: (){

    },);
  }
}
