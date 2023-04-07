import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/presentation/feature/product_detail/view/widget/product_detail_order_section/product_detail_order_option_item.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/product_detail_response.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailOrderSection extends StatelessWidget {
  final ProductDetailController controller;
  final Data? productDetail;
  const ProductDetailOrderSection({
    Key? key,
    required this.controller,
    required this.productDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          color: kPrimaryWhite(context: context),
          border: Border(
            top: BorderSide(
                color: kOnPrimaryContainerBlackGray(context: context),
                width: 0.5),
          )),
      child: Row(
        children: [
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.storeDetail,
                arguments: productDetail?.store.id),
            child: Column(
              children: [
                SvgPicture.asset(AppIcons.storeFront),
                Text(
                  "Store",
                  style: kTextHelperBold1(context: context),
                )
              ],
            ),
          ),
          SizedBox(width: 10.sp),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: kOnPrimaryBlack(context: context),
                borderRadius: BorderRadius.circular(16.sp),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => productDetail?.options.isEmpty == true
                          ? controller.addToCart(productId: productDetail?.id)
                          : showProductOptionBottomDialog(
                              context: context,
                              product: productDetail,
                            ),
                      child: Container(
                        width: 36.sp,
                        height: 36.sp,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.15),
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: kOnSecondaryWhite(context: context),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.sp),
                    Text(
                      "Order Now!",
                      style: kTextTitleBold(context: context)?.copyWith(
                        color: kPrimaryWhite(context: context),
                      ),
                    ),
                    SizedBox(width: 20.sp),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.sp),
                      child: VerticalDivider(
                        color: kPrimaryWhite(context: context),
                        thickness: 1.sp,
                        endIndent: 1,
                      ),
                    ),
                    // Expanded(
                    //   child: ProductDetailOrderSectionAmount(
                    //     amount: productDetail?.prices.priceAfterDiscount,
                    //   ),
                    // ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$ ",
                            style: kTextHeadline2(context: context)?.copyWith(
                              fontSize: 13.sp,
                              color: kPrimaryWhite(context: context),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${controller.price}",
                                  style: kTextHeadline2(context: context)
                                      ?.copyWith(
                                    color: kPrimaryWhite(context: context),
                                  ),
                                ),
                                TextSpan(
                                  text: ".${controller.decimal}",
                                  style:
                                      kTextDescriptionNormal(context: context)
                                          ?.copyWith(
                                    color: kPrimaryWhite(context: context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showProductOptionBottomDialog({
    required BuildContext context,
    required Data? product,
  }) {
    CustomDialog.showDialogBottomSheet(
      title: "Product Option",
      content: GetBuilder<ProductDetailController>(
        builder: ((controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDetailOrderOptionItem(
                controller: controller,
                product: product,
              ),
              Divider(
                thickness: 0.4.sp,
                color: AppColors.blackGray.withOpacity(.25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                  horizontal: 16.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: kTextTitleNormal(context: context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            color: Colors.black,
                          ),
                          child: const Icon(Icons.remove, color: Colors.white),
                        ),
                        SizedBox(
                          width: 50.sp,
                          child: Center(
                            child: Text(
                              "1",
                              style: kTextTitleBold(context: context),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.sp),
                            color: Colors.black,
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 0.4.sp,
                color: AppColors.blackGray.withOpacity(.25),
              ),
              SizedBox(height: 40.sp),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 17.sp),
                decoration: BoxDecoration(
                  color: kOnPrimaryBlack(context: context),
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 16.sp),
                child: Text(
                  "Add to Cart",
                  style: kTextTitleBold(context: context)?.copyWith(
                    color: kPrimaryWhite(context: context),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      onClose: () => controller.resetSelectedOption(),
    );
  }
}
