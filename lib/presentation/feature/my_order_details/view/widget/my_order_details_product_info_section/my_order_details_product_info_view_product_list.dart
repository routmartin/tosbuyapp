import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/my_order_details/controller/my_order_details_controller.dart';
import 'package:tostinh/routes/app_routes.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';

class MyOrderDetailsProductInfoViewProductList extends StatelessWidget {
  final MyOrderDetailsController controller;
  const MyOrderDetailsProductInfoViewProductList(
      {super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CustomButtonLinear(
        onPressed: () {},
        child: Wrap(
          children: [
            Divider(
              height: 1,
              color: kOnSurfaceVariantBlackGray(context: context),
            ),
            _productItem(context: context, index: index),
            SizedBox(
              height: 8.sp,
            ),
            _productAction(context: context),
          ],
        ),
      ),
    );
  }

  Widget _productItem({required BuildContext context, required int index}) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _productImage(),
          SizedBox(
            width: 8.sp,
          ),
          _productInfo(context: context, index: index),
        ],
      ),
    );
  }

  Widget _productAction({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.sp, right: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtonLinear(
            onPressed: () {
              Get.toNamed(AppRoutes.myOrderReviewProduct);
            },
            height: 30.sp,
            width: 95.sp,
            borderRadius: 8,
            borderSize: 0.5,
            borderColor: kOnPrimaryBlack(context: context),
            child: Text(
              "Review",
              style: kTextDescriptionNormal(context: context),
            ),
          ),
        ],
      ),
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
