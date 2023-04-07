import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_styles.dart';
import '../../../../../domain/entities/response/payment_method_response.dart';
import '../../../../component/view/custom_cached_image.dart';
import '../../../../component/view/custom_card.dart';
import '../../controller/payment_method_controller.dart';

class PaymentMethodViewItem extends StatelessWidget {
  final PaymentMethodController controller;
  final PaymentMethod paymentMethod;

  const PaymentMethodViewItem({
    Key? key,
    required this.controller,
    required this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(result: paymentMethod),
      child: CustomCard(
        child: Row(
          children: [
            SizedBox(
              height: 50.sp,
              width: 50.sp,
              child: CustomCachedImage(
                imageUrl: "${paymentMethod.image}",
                fit: BoxFit.cover,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 16.sp),
            Text(
              paymentMethod.name,
              style: kTextDescriptionNormal(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
