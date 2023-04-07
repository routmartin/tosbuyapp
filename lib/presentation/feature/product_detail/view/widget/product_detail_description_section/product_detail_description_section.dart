import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailDescriptionSection extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailDescriptionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomRequestIndicator(
        onLoad: controller.requestDetailsProduct,
        child: controller.productDetail?.data.detail?.isNotEmpty == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocals.productDetailDescription.tr,
                          style: kTextTitleBold(context: context),
                        ),
                        Text(controller.productDetail?.data.detail ?? ""),
                      ],
                    ),
                  ),
                  Container(
                    height: 6.sp,
                    color: kPrimaryContainerWhiteGray(context: context),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }
}
