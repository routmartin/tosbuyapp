import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';

import '../../../assets/app_locals.dart';

class CustomStateEndFailed extends StatelessWidget {
  final Function() onTapRetry;
  const CustomStateEndFailed({Key? key, required this.onTapRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentPagingStateView(
      stateTitle: AppLocals.stateFailedDescription.tr,
      onTapRetry: onTapRetry,
    );
  }
}
