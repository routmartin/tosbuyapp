import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoChatHistory extends StatelessWidget {
  const CustomStateNoChatHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoChatHistory,
      stateHeaderTitle: AppLocals.stateNoChatHistoryHeader.tr,
      stateDesTitle: AppLocals.stateNoChatHistoryDescription.tr,
      onTapRetry: null,
    );
  }
}
