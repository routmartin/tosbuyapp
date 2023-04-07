import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../component/view/custom_button_bottom.dart';
import '../../../../component/view/custom_request_indicator.dart';
import '../../controller/address_controller.dart';
import 'address_view_item.dart';

class AddressBodyPage extends StatelessWidget {
  final AddressController controller;

  const AddressBodyPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomRequestIndicator(
            onLoad: controller.getAddress,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.all(16.sp),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Column(
                        children: [
                          AddressViewItem(
                            controller: controller,
                            address: controller.addresses[index],
                          ),
                          if (index != controller.addresses.length)
                            SizedBox(height: 10.sp),
                        ],
                      ),
                      childCount: controller.addresses.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: CustomButtonBottom(
            title: AppLocals.addressAdd.tr,
            onPressed: () => controller.navigateNewAddress(),
          ),
        ),
      ],
    );
  }
}
