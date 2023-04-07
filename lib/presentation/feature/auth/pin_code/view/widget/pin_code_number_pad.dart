import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/auth/pin_code/controller/pincode_controller.dart';

import 'pin_code_action_button.dart';
import 'pin_code_number_pad_button.dart';

class PinCodeNumPadWrapper extends StatelessWidget {
  const PinCodeNumPadWrapper({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PinCodeController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 47.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonOfNumPad(
                    num: "1", onPressed: () => controller.onPinCodeTab(1)),
                ButtonOfNumPad(
                    num: "2", onPressed: () => controller.onPinCodeTab(2)),
                ButtonOfNumPad(
                    num: "3", onPressed: () => controller.onPinCodeTab(3))
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonOfNumPad(
                    num: "4", onPressed: () => controller.onPinCodeTab(4)),
                ButtonOfNumPad(
                    num: "5", onPressed: () => controller.onPinCodeTab(5)),
                ButtonOfNumPad(
                    num: "6", onPressed: () => controller.onPinCodeTab(6))
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonOfNumPad(
                    num: "7", onPressed: () => controller.onPinCodeTab(7)),
                ButtonOfNumPad(
                    num: "8", onPressed: () => controller.onPinCodeTab(8)),
                ButtonOfNumPad(
                    num: "9", onPressed: () => controller.onPinCodeTab(9))
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PinCodeActionButton(
                  actionIcon: Text(
                    'C',
                    style: kTextDescriptionBold(context: context)
                        ?.copyWith(fontSize: 36.sp),
                  ),
                  onPressed: controller.onClear,
                ),
                ButtonOfNumPad(
                  num: "0",
                  onPressed: () => controller.onPinCodeTab(0),
                ),
                PinCodeActionButton(
                  actionIcon: const Icon(Icons.backspace_sharp),
                  onPressed: controller.onRemove,
                ),
              ],
            ),
            SizedBox(height: 37.h),
            Text(
              AppLocals.forgetPin.tr,
              style: kTextHeadline3(context: context)?.copyWith(
                fontSize: 16.sp,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
