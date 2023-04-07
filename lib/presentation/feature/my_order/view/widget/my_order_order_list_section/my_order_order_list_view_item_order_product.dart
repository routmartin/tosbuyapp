import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/my_order/controller/my_order_controller.dart';
import 'package:tostinh/routes/app_routes.dart';

class MyOrderOrderListViewItemOrderProduct extends StatelessWidget {
  const MyOrderOrderListViewItemOrderProduct(
      {Key? key, required this.controller})
      : super(key: key);
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CustomButtonLinear(
        onPressed: () {
          Get.toNamed(AppRoutes.myOrderDetails);
        },
        child: Container(
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: kOnPrimaryContainerBlackGray(context: context),
                width: 0.5.sp,
              ),
            ),
          ),
          child: _productItem(context: context, index: index),
        ),
      ),
    );
  }

  Widget _productItem({required BuildContext context, required int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _productImage(),
        SizedBox(
          width: 8.sp,
        ),
        _productInfo(context: context, index: index),
      ],
    );
  }

  Widget _productImage() {
    return Container(
      width: 100.sp,
      height: 100.sp,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey,
      ),
    );
  }

  Widget _productInfo({required BuildContext context, required int index}) {
    return SizedBox(
      height: 100.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product item $index",
                style: kTextDescriptionBold(context: context),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                  color: kPrimaryContainerWhiteGray(context: context),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "Black, Size 43, Man",
                  style: kTextHelperNormal2(context: context)?.copyWith(
                    color: kOnPrimaryContainerBlackGray(
                      context: context,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "\$52.00 x1",
            style: kTextTitleBold(context: context),
          )
        ],
      ),
    );
  }
}
