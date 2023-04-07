import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoNotification extends StatelessWidget {
  const CustomStateNoNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoNotification,
      stateHeaderTitle: AppLocals.stateNoNotificationHeader.tr,
      stateDesTitle: AppLocals.stateNoNotificationDescription.tr,
      onTapRetry: null,
    );
  }
}
