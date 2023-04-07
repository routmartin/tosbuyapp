import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../assets/app_styles.dart';
import '../../../component/view/custom_button_linear.dart';
import '../controller/order_status_controller.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderStatusController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                controller.success ? AppIcons.orderSuccess : AppIcons.orderFail,
              ),
              SizedBox(height: 50.sp),
              Text(
                controller.success
                    ? AppLocals.orderSuccess.tr
                    : AppLocals.orderFail.tr,
                style: kTextHeadline1(context: context),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.sp),
                child: Text(
                  controller.success
                      ? AppLocals.orderSuccessMsg.tr
                      : AppLocals.orderFailMsg.tr,
                  style: kTextDescriptionNormal(context: context),
                ),
              ),
              CustomButtonLinear(
                width: 100.sp,
                borderColor: kOnPrimaryContainerBlackGray(context: context),
                borderSize: 0.4,
                borderRadius: 8,
                height: 40.sp,
                onPressed: () => controller.success
                    ? Get.offAndToNamed(AppRoutes.navigation)
                    : Get.back(),
                child: Text(
                  controller.success
                      ? AppLocals.orderGoHome.tr
                      : AppLocals.orderGoBack.tr,
                  style: kTextDescriptionNormal(context: context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
