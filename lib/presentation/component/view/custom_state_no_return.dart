import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoReturn extends StatelessWidget {
  const CustomStateNoReturn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoReturn,
      stateHeaderTitle: AppLocals.stateNoReturnHeader.tr,
      stateDesTitle: AppLocals.stateNoReturnDescription.tr,
      onTapRetry: null,
    );
  }
}
