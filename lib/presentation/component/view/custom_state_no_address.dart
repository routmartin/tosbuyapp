import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoAddress extends StatelessWidget {
  const CustomStateNoAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoAddress,
      stateHeaderTitle: AppLocals.stateNoAddressHeader.tr,
      stateDesTitle: AppLocals.stateNoAddressDescription.tr,
      onTapRetry: null,
    );
  }
}
