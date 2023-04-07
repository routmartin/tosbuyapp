import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';

import '../../../assets/app_locals.dart';

class CustomStateEndNoMoreData extends StatelessWidget {
  const CustomStateEndNoMoreData({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentPagingStateView(
      stateTitle: AppLocals.stateNoMoreDataHeader.tr,
      onTapRetry: null,
    );
  }
}
