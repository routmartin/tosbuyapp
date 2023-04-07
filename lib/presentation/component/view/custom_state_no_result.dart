import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoResult extends StatelessWidget {
  const CustomStateNoResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoResult,
      stateHeaderTitle: AppLocals.stateNoResultHeader.tr,
      stateDesTitle: AppLocals.stateNoResultDescription.tr,
      onTapRetry: null,
    );
  }
}
