import 'package:flutter/material.dart';

import '../../controller/store_detail_controller.dart';
import 'store_detail_best_sale_section/store_detail_best_sale_section.dart';
import 'store_detail_home_section/store_detail_home_section.dart';
import 'store_detail_promotion_section/store_detail_promotion_section.dart';

class StoreDetailBody extends StatelessWidget {
  final StoreDetailController controller;

  const StoreDetailBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: [
        StoreDetailHomeSection(controller: controller),
        StoreDetailPromotionSection(controller: controller),
        StoreDetailBestSaleSection(controller: controller),
      ],
    );
  }
}
