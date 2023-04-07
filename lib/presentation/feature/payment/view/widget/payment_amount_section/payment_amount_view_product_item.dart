import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_colors.dart';

import '../../../../../../assets/app_styles.dart';

class PaymentAmountViewProductItem extends StatelessWidget {
  const PaymentAmountViewProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.fromSize(
                child: Image.network(
                  "https://www.macworld.com/wp-content/uploads/2022/07/13inch-macbook-pro-m1-002-3.jpg?quality=50&strip=all&w=1024",
                  width: 100.sp,
                  height: 100.sp,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MacBook Pro 13-inch with M2",
                    style: kTextDescriptionBold(context: context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.sp, bottom: 8.sp),
                    padding:
                        EdgeInsets.symmetric(vertical: 3.sp, horizontal: 6.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: kPrimaryContainerWhiteGray(context: context),
                    ),
                    child: Text(
                      "White, Size 43, Man",
                      style: kTextHelperNormal2(context: context)?.copyWith(
                        color: kOnPrimaryContainerBlackGray(context: context),
                      ),
                    ),
                  ),
                  Text(
                    "\$ 8.00",
                    style: kTextTitleBold(context: context)?.copyWith(
                      color: AppColors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Divider(
            thickness: 1,
            color: kPrimaryContainerWhiteGray(
              context: context,
            ),
          ),
        ),
      ],
    );
  }
}
