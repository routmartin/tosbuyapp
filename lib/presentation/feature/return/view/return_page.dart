import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/return/controller/return_controller.dart';

import '../../../../assets/app_locals.dart';
import '../../../../assets/app_styles.dart';
import '../../../component/view/custom_app_bar.dart';
import '../../../component/view/custom_request_indicator.dart';
import 'widget/return_item_view.dart';

class ReturnPage extends StatelessWidget {
  const ReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReturnController>(
      init: ReturnController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: CustomAppBar(
          onTapLeft: () => Get.back(),
          title: AppLocals.returnProduct.tr,
          elevation: 0,
        ),
        body: CustomRequestIndicator(
          onLoad: controller.getAddress,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 10.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Column(
                      children: [
                        ReturnItemView(itemIndex: index),
                        if (index != 2)
                          Divider(
                            height: 0.5.sp,
                            color:
                                kOnPrimaryContainerBlackGray(context: context),
                          ),
                      ],
                    ),
                    childCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
