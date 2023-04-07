import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';

class NewAddressViewForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorMsg;
  final TextInputType? inputType;
  final bool? isEnable;

  const NewAddressViewForm({
    Key? key,
    required this.controller,
    required this.label,
    required this.errorMsg,
    this.inputType,
    this.isEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: isEnable ?? true,
      validator: (value) {
        if (value == null || value.isEmpty) return errorMsg;
        return null;
      },
      keyboardType: inputType ?? TextInputType.text,
      style: kTextTitleBold(context: context),
      maxLines: 1,
      decoration: kInputDecorationUnderline(context: context)?.copyWith(
        contentPadding: EdgeInsets.symmetric(vertical: 6.sp),
        label: Text(label),
      ),
    );
  }
}
