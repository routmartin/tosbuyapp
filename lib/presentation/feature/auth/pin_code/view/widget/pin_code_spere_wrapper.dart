// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/feature/auth/pin_code/controller/pincode_controller.dart';

import 'pin_code_sphere.dart';

class PinCodeSpereWrapper extends StatelessWidget {
  const PinCodeSpereWrapper({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final String title;
  final PinCodeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: kTextHeadline2(context: context)),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.only(left: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) {
                  controller.pincodeList.length;
                  return PinCodeSphere(
                    input: controller.isActivePinCodeSpere(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
