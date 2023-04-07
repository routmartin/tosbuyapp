import 'package:flutter/cupertino.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';
import 'package:tostinh/presentation/feature/nav_home/controller/home_controller.dart';

import 'home_app_bar.dart';
import 'home_choice_section/home_choice_section.dart';
import 'home_flash_sale_section/home_flash_sale_section.dart';
import 'home_recommend_product_header_section/home_recommend_product_header_section.dart';
import 'home_recommend_product_section/home_recommend_product_section.dart';
import 'home_slider_section/home_slider_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(controller: controller),
        const HomeSliderSection(),
        HomeChoiceSection(controller: controller),
        HomeFlashSaleSection(controller: controller),
        const HomeRecommendProductHeaderSection(),
        HomeRecommendProductSection(products: controller.products),
        CustomSliverPaging(
          controller: controller.requestIndicatorController,
          onLoadMore: controller.requestMoreProduct,
        ),
      ],
    );
  }
}
