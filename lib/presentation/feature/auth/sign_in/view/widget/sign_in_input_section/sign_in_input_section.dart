import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/controller/sign_in_controller.dart';
import 'package:tostinh/presentation/feature/auth/sign_in/view/widget/sign_in_input_section/sign_in_input_view_phone_number.dart';

class SignInInputSection extends StatelessWidget {
  final SignInController controller;
  const SignInInputSection({ Key? key, required this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: SignInInputViewPhoneNumber(controller: controller,),
    );
  }
}