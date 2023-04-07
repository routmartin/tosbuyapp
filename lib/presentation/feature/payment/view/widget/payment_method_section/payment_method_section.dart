import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_card.dart';
import '../../../controller/payment_controller.dart';
import '../payment_view/payment_view_icon.dart';

class PaymentMethodSection extends StatelessWidget {
  final PaymentController controller;

  const PaymentMethodSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: InkWell(
        onTap: () => controller.selectPaymentMethod(),
        child: CustomCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const PaymentViewIcon(
                      asset: AppIcons.paymentMethod,
                    ),
                    SizedBox(width: 16.sp),
                    Expanded(
                      child: Text(
                        controller.paymentMethod == null
                            ? AppLocals.paymentSelectPaymentMethod.tr
                            : "${controller.paymentMethod?.name}",
                        style: kTextDescriptionNormal(context: context),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(AppIcons.paymentForward),
            ],
          ),
        ),
      ),
    );
  }
}
