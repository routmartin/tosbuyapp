import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoPurchase extends StatelessWidget {
  const CustomStateNoPurchase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoPurchase,
      stateHeaderTitle: AppLocals.stateNoPurchaseHeader.tr,
      stateDesTitle: AppLocals.stateNoPurchaseDescription.tr,
      onTapRetry: null,
    );
  }
}
