import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/coupon/view/widget/coupon_view/coupon_view_info.dart';
import 'package:tostinh/presentation/feature/coupon/view/widget/coupon_view/coupon_view_shop.dart';

class CouponViewItem extends StatelessWidget {
  const CouponViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CouponViewShop(),
        Divider(
          height: 1,
          color: kOnPrimaryContainerBlackGray(context: context),
        ),
        const CouponViewInfo()
      ],
    );
  }
}
