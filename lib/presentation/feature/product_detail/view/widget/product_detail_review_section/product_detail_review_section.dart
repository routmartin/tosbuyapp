import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/component/view/custom_review_item.dart';
import 'package:tostinh/presentation/feature/product_detail/controller/product_detail_controller.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import 'product_detail_review_view_rating.dart';

class ProductDetailReviewSection extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailReviewSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: controller.isProductDetailLoaded
          ? CustomRequestIndicator(
              onLoad: controller.requestReviewProduct,
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocals.productDetailReview.tr,
                          style: kTextTitleBold(context: context),
                        ),
                        if (controller.productDetail!.data.totalReview == 0)
                          Text(
                            "This product has no review",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kTextDescriptionBold(context: context)
                                ?.copyWith(
                              color: kSecondaryContainerBlackGray(
                                context: context,
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (controller.productDetail!.data.totalReview > 0)
                      SizedBox(height: 16.sp),
                    if (controller.productDetail!.data.totalReview > 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${controller.productDetail?.data.review.totalRating}",
                                      style: kTextHeadline1(context: context),
                                    ),
                                    Text(
                                      "${controller.productDetail?.data.review.totalReviewer} ratings",
                                      style: kTextDescriptionNormal(
                                              context: context)
                                          ?.copyWith(
                                        color: kOnPrimaryContainerBlackGray(
                                            context: context),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  verticalDirection: VerticalDirection.up,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: List.generate(
                                    6,
                                    (index) => ReviewStar(count: index),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              reverse: true,
                              padding: EdgeInsets.all(2.sp),
                              shrinkWrap: true,
                              itemBuilder: ((context, index) =>
                                  ProductDetailReviewViewRating(
                                    percent: controller.stars[index].percentage,
                                  )),
                              separatorBuilder: ((context, index) =>
                                  SizedBox(height: 6.5.sp)),
                              itemCount: controller.stars.length,
                            ),
                          ),
                          Column(
                            verticalDirection: VerticalDirection.up,
                            children: List.generate(
                              controller.stars.length,
                              (index) {
                                return Column(
                                  children: [
                                    Text("${controller.stars[index].star}"),
                                    SizedBox(height: 1.sp),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    if (controller.productDetail!.data.totalReview > 0)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.sp),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${controller.productDetail?.data.totalReview} reviews",
                          style: kTextHeadline2(context: context),
                        ),
                      ),
                    if (controller.productDetail!.data.totalReview > 0)
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 0),
                        itemCount: controller.productReview?.data.length ?? 0,
                        itemBuilder: (context, index) {
                          return CustomReviewItem(
                            reviewData: controller.productReview!.data[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10.sp,
                          );
                        },
                      ),
                  ],
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
