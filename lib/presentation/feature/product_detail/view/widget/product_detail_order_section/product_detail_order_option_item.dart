import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/product_detail_response.dart';
import '../../../controller/product_detail_controller.dart';

class ProductDetailOrderOptionItem extends StatelessWidget {
  final ProductDetailController controller;
  final Data? product;
  const ProductDetailOrderOptionItem({
    super.key,
    required this.controller,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, optionIndex) {
        final option = product?.options[optionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 16.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Text(
                "${option?.optionName}",
                style: kTextTitleNormal(context: context),
              ),
            ),
            SizedBox(height: 10.sp),
            SizedBox(
              height: 40.sp,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final optionValue = option?.optionValue[index];
                  return InkWell(
                    onTap: () => controller.selectOptionValue(
                      optionIndex: optionIndex,
                      optionValueId: optionValue?.optionValueId,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: optionValue?.isSelected == true
                            ? ColorPinkVariant.lightHover
                            : Colors.white,
                        border: Border.all(
                          color: kOnPrimaryContainerBlackGray(context: context),
                          width: 0.4.sp,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.sp,
                        vertical: 10.sp,
                      ),
                      child: Text(
                        "${optionValue?.optionValueName}",
                        style: kTextDescriptionNormal(context: context),
                      ),
                    ),
                  );
                },
                itemCount: option!.optionValue.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 22.sp),
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
              ),
            ),
          ],
        );
      }),
      itemCount: product?.options.length,
      shrinkWrap: true,
    );
  }
}
