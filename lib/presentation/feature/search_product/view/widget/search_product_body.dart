import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product/controller/search_product_controller.dart';
import 'package:tostinh/presentation/feature/search_product/view/widget/search_product_app_bar.dart';

import '../../../../../assets/app_locals.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/model/choice_chips_item_data.dart';
import '../../../../component/view/custom_choice_chips_single.dart';

class SearchProductBody extends StatelessWidget {
  final SearchProductController controller;
  const SearchProductBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchProductAppBar(controller: controller),
        SizedBox(
          height: 5.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
          child: Text(
            AppLocals.searchHistory.tr,
            style: kTextDescriptionBold(context: context)?.copyWith(
              color: kOnPrimaryContainerBlackGray(context: context),
            ),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: CustomChoiceChipsSingle(
            list: [
              ChoiceChipsItemData(
                title: "Bean Coffee1",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "My bean",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "Sirth",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "Car",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "Home",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "Vaccuum",
                isEnabled: true,
                isSelected: false,
              ),
              ChoiceChipsItemData(
                title: "Coffee",
                isEnabled: true,
                isSelected: false,
              ),
            ],
            radius: 22,
            spacing: 4.sp,
            runSpacing: 4.sp,
            backgroundSelectedColor: kInverseSurfaceBlack(context: context),
            backgroundUnselectedColor:
                kSurfaceVariantWhiteGray(context: context),
            borderSelectedColor: Colors.transparent,
            borderUnselectedColor: Colors.transparent,
            textSelectedColor: kOnInverseSurfaceWhite(context: context),
            textUnselectedColor: kOnSurfaceVariantBlackGray(context: context),
          ),
        )
      ],
    );
  }
}
