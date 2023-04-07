import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';

class CustomStateNoData extends StatelessWidget {
  final Function() onTapRetry;
  const CustomStateNoData({
    Key? key,
    required this.onTapRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoProduct,
      stateHeaderTitle: AppLocals.stateNoDataHeader.tr,
      stateDesTitle: AppLocals.stateNoDataDescription.tr,
      onTapRetry: onTapRetry,
    );
  }
}
