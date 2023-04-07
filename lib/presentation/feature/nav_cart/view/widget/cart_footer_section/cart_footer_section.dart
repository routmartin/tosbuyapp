import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/nav_cart/controller/cart_controller.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../routes/app_routes.dart';
import '../../../../../component/view/custom_button_linear.dart';

class CartFooterSection extends StatelessWidget {
  final CartController controller;
  const CartFooterSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.carts.isEmpty
        ? Container()
        : Container(
            color: kPrimaryWhite(context: context),
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 11.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.sp,
                        height: 30.sp,
                        child: Checkbox(
                          value: controller.isSelectedAllProduct,
                          onChanged: (value) => controller.selectAll(value),
                          shape: const CircleBorder(),
                          activeColor: ColorPinkVariant.normal,
                        ),
                      ),
                      Text(
                        AppLocals.cartAll.tr,
                        style: kTextHelperNormal1(context: context),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocals.cartTotal.tr,
                        style: kTextTitleNormal(context: context),
                      ),
                      TextSpan(
                        text: "\$ ${controller.totalAmount}",
                        style: kTextTitleBold(context: context),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 23.sp),
                CustomButtonLinear(
                  width: 117.sp,
                  height: 44.sp,
                  onPressed: () => Get.toNamed(AppRoutes.payment),
                  backgroundColor: kOnPrimaryBlack(context: context),
                  borderRadius: 16,
                  child: Text(
                    AppLocals.cartCheckOut.tr,
                    style: kTextTitleBold(context: context)?.copyWith(
                      color: kPrimaryWhite(context: context),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
