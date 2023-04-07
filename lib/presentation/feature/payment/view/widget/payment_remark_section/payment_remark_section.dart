import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_card.dart';

class PaymentRemarkSection extends StatelessWidget {
  const PaymentRemarkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocals.paymentRemark.tr,
              style: kTextDescriptionBold(context: context)?.copyWith(
                color: kOnPrimaryContainerBlackGray(
                  context: context,
                ),
              ),
            ),
            SizedBox(height: 15.sp),
            TextField(
              maxLength: 200,
              keyboardType: TextInputType.text,
              decoration: kInputDecorationUnderline(
                context: context,
              )?.copyWith(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 1.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
