import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_constants.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../component/view/custom_button_linear.dart';
import '../../../../../component/view/custom_item_product.dart';
import '../../../../../component/view/custom_request_indicator.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailRelatedSection extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailRelatedSection({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: controller.isProductReviewLoaded
          ? CustomRequestIndicator(
              onLoad: controller.requestRelatedProduct,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocals.productDetailRelatedProduct.tr,
                          style: kTextTitleBold(context: context),
                        ),
                        if (controller.totalRelatedProduct >
                            controller.indicatorController.limit)
                          CustomButtonLinear(
                            onPressed: () => Get.toNamed(
                              AppRoutes.relatedProduct,
                              arguments: controller.productDetail?.data,
                            ),
                            borderRadius: 6,
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Text(
                                AppLocals.globalSeeMore.tr,
                                style: kTextHelperBold1(context: context)
                                    ?.copyWith(color: ColorPinkVariant.normal),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.sp, vertical: 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.sp,
                      mainAxisSpacing: 10.sp,
                      childAspectRatio: AppConstants.aspectRatioMobileProduct,
                    ),
                    itemCount: controller.productRelated.length,
                    itemBuilder: ((context, index) {
                      return CustomItemProduct(
                        onItemPressed: (item) {
                          Get.delete<ProductDetailController>();
                          Get.toNamed(
                            AppRoutes.productDetail,
                            arguments: item,
                            preventDuplicates: false,
                          );
                        },
                        product: controller.productRelated[index],
                      );
                    }),
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
