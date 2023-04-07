import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_card.dart';
import '../../../../../component/view/custom_input_dialog.dart';
import '../../../controller/payment_controller.dart';
import 'payment_amount_view_fee.dart';
import 'payment_amount_view_product_item.dart';

class PaymentAmountSection extends StatelessWidget {
  final PaymentController controller;

  const PaymentAmountSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: CustomCard(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  const PaymentAmountViewProductItem(),
              shrinkWrap: true,
              itemCount: 2,
            ),
            PaymentAmountViewFee(
              title: AppLocals.paymentSubtotal.tr,
              data: "US \$16.00",
            ),
            PaymentAmountViewFee(
              title: AppLocals.paymentShippingFee.tr,
              data: "US \$2.00",
            ),
            PaymentAmountViewFee(
              title: AppLocals.paymentStoreCoupon.tr,
              data: "Apply Coupon",
              color: AppColors.pink,
              onPressed: () => showCouponInputDialog(
                context: context,
                controller: controller.storeCouponCodeController,
                validate: (value) => controller.validateStoreCouponCode(value),
                onPressed: () {
                  if (controller.validStoreCouponCode) {
                    CustomDialog.closeDialog();
                    controller.storeCouponCodeController.clear();
                  }
                },
              ),
            ),
            PaymentAmountViewFee(
              title: AppLocals.paymentCoupon.tr,
              data: "Apply Coupon",
              color: AppColors.pink,
              onPressed: () => showCouponInputDialog(
                context: context,
                controller: controller.couponCodeController,
                validate: (value) => controller.validateCouponCode(value),
                onPressed: () {
                  if (controller.validCouponCode) {
                    CustomDialog.closeDialog();
                    controller.couponCodeController.clear();
                  }
                },
              ),
            ),
            PaymentAmountViewFee(
              title: AppLocals.paymentTotal.tr,
              data: "US \$18.00",
            ),
          ],
        ),
      ),
    );
  }

  void showCouponInputDialog({
    required BuildContext context,
    required TextEditingController controller,
    required Function(bool) validate,
    required Function() onPressed,
  }) {
    CustomDialog.showDialogInput(
      title: "Apply Coupon Code",
      content: CustomInputDialog(
        controller: controller,
        errorText: "Please enter coupon code",
        validate: (value) => validate.call(value),
      ),
      actions: [
        ButtonDialogInfo(
          onPressed: () => onPressed.call(),
          title: "OK",
          color: kOnPrimaryBlack(context: context),
        )
      ],
    );
  }
}
