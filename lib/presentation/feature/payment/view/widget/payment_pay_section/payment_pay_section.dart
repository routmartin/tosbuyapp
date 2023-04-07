import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';

class PaymentPaySection extends StatelessWidget {
  const PaymentPaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryWhite(context: context),
        boxShadow: [
          BoxShadow(
            color: kOnPrimaryBlack(context: context).withOpacity(.12),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(-2, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$ 21.00",
            style: kTextHeadline3(context: context),
          ),
          CustomButtonLinear(
            onPressed: () => Get.toNamed(
              AppRoutes.orderStatus,
              arguments: false,
            ),
            backgroundColor: kOnPrimaryBlack(context: context),
            borderRadius: 16,
            width: 189.sp,
            height: 50.sp,
            child: Text(
              AppLocals.paymentPayNow.tr,
              style: kTextTitleBold(context: context)?.copyWith(
                color: kPrimaryWhite(context: context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
