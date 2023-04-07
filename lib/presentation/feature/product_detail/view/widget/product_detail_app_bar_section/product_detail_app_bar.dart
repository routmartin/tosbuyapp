import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/product_detail/view/widget/product_detail_app_bar_section/product_detail_app_bar_view_title_header.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_app_bar.dart';
import '../../../controller/product_detail_controller.dart';
import 'product_detail_app_bar_view_headline.dart';
import 'product_detail_app_bar_view_media_slide.dart';

class ProductDetailAppBar extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leadingWidth: kToolbarHeight + 16.sp,
      leading: Row(
        children: [
          SizedBox(
            width: 16.sp,
          ),
          IconButtonAppBar(
            onPressed: () => Get.back(),
            child: SvgPicture.asset(
              AppIcons.back,
              color: kOnPrimaryContainerBlackGray(context: context),
            ),
          ),
        ],
      ),
      actions: [
        IconButtonAppBar(
          onPressed: () {},
          child: SvgPicture.asset(
            AppIcons.shareOutline,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
        ),
        SizedBox(
          width: 16.sp,
        )
      ],
      expandedHeight: 420.sp,
      pinned: true,
      floating: false,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: ProductDetailAppBarViewTitleHeader(
          text: controller.productDetail?.data.name ?? "",
        ),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Expanded(
                child: ProductDetailAppBarViewMediaSlide(
                  controller: controller,
                ),
              ),
              ProductDetailAppBarViewHeadline(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
