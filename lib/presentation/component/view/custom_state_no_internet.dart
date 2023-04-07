import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoInternet extends StatelessWidget {
  const CustomStateNoInternet({
    Key? key,
    required this.onTapRetry,
  }) : super(key: key);
  final Function() onTapRetry;

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoInternet,
      stateHeaderTitle: AppLocals.stateNoInternetHeader.tr,
      stateDesTitle: AppLocals.stateNoInternetDescription.tr,
      onTapRetry: onTapRetry,
    );
  }
}
