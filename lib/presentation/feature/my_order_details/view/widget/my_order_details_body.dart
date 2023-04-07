import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_export_section/my_order_details_export_section.dart';

import 'my_order_details_address_section/my_order_details_address_section.dart';
import 'my_order_details_order_section/my_order_details_order_section.dart';
import 'my_order_details_product_info_section/my_order_details_product_info_section.dart';

class MyOrderDetailsBody extends StatelessWidget {
  const MyOrderDetailsBody({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MyOrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildSpace(),
                MyOrderDetailsProductInfoSection(controller: controller),
                _buildSpace(),
                MyOrderDetailsAddressSection(controller: controller),
                _buildSpace(),
                MyOrderDetailsOrderSection(controller: controller),
                _buildSpace(),
              ],
            ),
          ),
        ),
        MyOrderDetailsExportSection(controller: controller),
      ],
    );
  }

  Widget _buildSpace() {
    return SizedBox(
      height: 16.sp,
    );
  }
}
