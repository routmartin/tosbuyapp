import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateSomethingWentWrong extends StatelessWidget {
  const CustomStateSomethingWentWrong({Key? key, required this.onTapRetry})
      : super(key: key);
  final VoidCallback onTapRetry;

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateErrorSomethingWentWrong,
      stateHeaderTitle: AppLocals.stateSomethingWrongHeader.tr,
      stateDesTitle: AppLocals.stateSomethingWrongDescription.tr,
      onTapRetry: onTapRetry,
    );
  }
}
