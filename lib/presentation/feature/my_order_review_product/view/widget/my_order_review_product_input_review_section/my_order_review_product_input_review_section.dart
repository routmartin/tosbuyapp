import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';

class MyOrderReviewProductInputReviewSection extends StatelessWidget {
  const MyOrderReviewProductInputReviewSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocals.orderPleaseShareYourOpinion.tr,
          textAlign: TextAlign.center,
          style: kTextHeadline3(context: context),
        ),
        SizedBox(
          height: 16.sp,
        ),
        TextFormField(
          maxLength: 300,
          maxLines: 10,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            filled: true,
            fillColor: kPrimaryWhite(context: context),
            border: InputBorder.none,
            hintText: AppLocals.orderYourReview.tr,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kSecondaryContainerBlackGray(context: context),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kSecondaryContainerBlackGray(context: context),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
