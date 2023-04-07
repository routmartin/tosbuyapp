import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';

import '../../../assets/app_locals.dart';

class CustomStateEndNoInternet extends StatelessWidget {
  final Function() onTapRetry;
  const CustomStateEndNoInternet({Key? key, required this.onTapRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentPagingStateView(
      stateTitle: AppLocals.stateNoInternetHeader.tr,
      onTapRetry: onTapRetry,
    );
  }
}
