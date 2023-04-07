import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/component/view/custom_button_bottom.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';

class MyOrderDetailsExportSection extends StatelessWidget {
  final MyOrderDetailsController controller;
  const MyOrderDetailsExportSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: CustomButtonBottom(title: "Export PDF", onPressed: () {}),
    );
  }
}
