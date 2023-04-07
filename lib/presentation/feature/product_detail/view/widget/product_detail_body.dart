import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/product_detail/view/widget/product_detail_related_section/product_detail_related_section.dart';

import '../../controller/product_detail_controller.dart';
import 'product_detail_app_bar_section/product_detail_app_bar.dart';
import 'product_detail_description_section/product_detail_description_section.dart';
import 'product_detail_review_section/product_detail_review_section.dart';

class ProductDetailBody extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: false,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          ProductDetailAppBar(controller: controller),
        ];
      },
      body: CustomScrollView(
        slivers: [
          ProductDetailDescriptionSection(controller: controller),
          ProductDetailReviewSection(controller: controller),
          SliverToBoxAdapter(
            child: Container(
              height: 6.sp,
              color: kPrimaryContainerWhiteGray(context: context),
            ),
          ),
          ProductDetailRelatedSection(controller: controller),
        ],
      ),
    );
  }
}
