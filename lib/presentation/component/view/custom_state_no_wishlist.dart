import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_icons.dart';
import 'package:tostinh/assets/app_locals.dart';

import 'custom_request_indicator.dart';

class CustomStateNoWislist extends StatelessWidget {
  const CustomStateNoWislist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentStateView(
      stateIconPath: AppIcons.stateNoProduct,
      stateHeaderTitle: AppLocals.stateNoWishlistHeader.tr,
      stateDesTitle: AppLocals.stateNoWishlistDescription.tr,
      onTapRetry: null,
    );
  }
}
