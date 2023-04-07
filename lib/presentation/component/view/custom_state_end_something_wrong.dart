import 'package:flutter/material.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';

import '../../../assets/app_locals.dart';

class CustomStateEndSomethingWrong extends StatelessWidget {
  final Function() onTapRetry;
  const CustomStateEndSomethingWrong({Key? key, required this.onTapRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ComponentPagingStateView(
      stateTitle: AppLocals.stateSomethingWrongHeader,
      onTapRetry: onTapRetry,
    );
  }
}
