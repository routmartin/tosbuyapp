import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/product_filter/view/widget/product_filter_category/product_filter_category.dart';
import 'package:tostinh/presentation/feature/product_filter/view/widget/product_filter_colors/product_filter_colors.dart';
import 'package:tostinh/presentation/feature/product_filter/view/widget/product_filter_price_range/product_filter_price_range.dart';
import 'package:tostinh/presentation/feature/sample/controller/sample_controller.dart';

import '../../../../assets/app_colors.dart';
import '../../../../assets/app_locals.dart';
import '../../../../assets/app_styles.dart';
import '../../../component/view/custom_app_bar.dart';
import 'widget/product_filter_size/product_filter_size.dart';

class ProductFilterPage extends StatelessWidget {
  const ProductFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SampleController>(
      init: SampleController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: CustomAppBar(
          elevation: 0,
          onTapLeft: () => Get.back(),
          title: AppLocals.filters,
          actions: [
            TextButtonAppBar(
              onPressed: () {},
              child: Text(
                AppLocals.apply.tr,
                style: kTextHeadline3(context: context)?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.pink,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 10.sp),
            ProductFilterPriceRange(),
            ProductFilterColors(),
            ProductFitlerSize(),
            ProductFitlerCategory()
          ],
        ),
      ),
    );
  }
}
