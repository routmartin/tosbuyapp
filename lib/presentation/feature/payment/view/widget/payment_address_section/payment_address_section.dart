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

class PaymentAddressSection extends StatelessWidget {
  final PaymentController controller;

  const PaymentAddressSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.sp,
        right: 16.sp,
        top: 16.sp,
      ),
      child: InkWell(
        onTap: () => controller.selectShippingAddress(),
        child: CustomCard(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const PaymentViewIcon(asset: AppIcons.address),
                    SizedBox(width: 16.sp),
                    controller.shippingAddress == null
                        ? Text(
                            AppLocals.paymentSelectAddress.tr,
                            style: kTextDescriptionNormal(context: context),
                          )
                        : Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${controller.shippingAddress?.label}"),
                                SizedBox(height: 5.sp),
                                Text("${controller.shippingAddress?.phone}"),
                                SizedBox(height: 5.sp),
                                Text(
                                  "${controller.shippingAddress?.addressDetail}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
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
