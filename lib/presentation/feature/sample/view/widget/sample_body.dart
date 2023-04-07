import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tostinh/presentation/feature/sample/controller/sample_controller.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/model/choice_chips_item_data.dart';
import '../../../../component/view/custom_button_linear.dart';
import '../../../../component/view/custom_choice_chips_multiple.dart';
import '../../../../component/view/custom_choice_chips_single.dart';

class SampleBody extends StatelessWidget {
  final SampleController controller;

  const SampleBody({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtonLinear(
            backgroundColor: Colors.black,
            height: 60,
            borderRadius: 10,
            onPressed: () {},
            child: Text(
              "Text wrap content",
              style: kTextDescriptionNormal(context: context)?.copyWith(
                color: kOnSecondaryWhite(context: context),
              ),
              maxLines: 1,
            ),
          ),
          CustomButtonLinear(
            backgroundColor: AppColors.white,
            width: 100,
            height: 50,
            borderRadius: 10,
            borderColor: Colors.pink,
            onPressed: () {},
            child: SvgPicture.asset(
              AppIcons.navHome,
              fit: BoxFit.cover,
              color: kOnPrimaryBlack(context: context),
              width: 8.16,
              height: 8.16,
            ),
          ),
          CustomChoiceChipsSingle(
            radius: 8,
            list: [
              ChoiceChipsItemData(
                title: "item 0",
                isSelected: true,
                isEnabled: true,
                value: "My data 0",
              ),
              ChoiceChipsItemData(
                title: "item 1",
                isSelected: true,
                isEnabled: true,
                value: "My data 1",
              ),
              ChoiceChipsItemData(
                title: "item 2",
                isSelected: true,
                isEnabled: true,
                value: "My data 2",
              ),
            ],
            onSelected: (ChoiceChipsItemData item) {
            },
            backgroundSelectedColor: AppColors.pink,
            backgroundUnselectedColor: kPrimaryWhite(context: context),
            backgroundDisabledColor: kPrimaryWhite(context: context),
            borderSelectedColor: AppColors.pink,
            borderUnselectedColor: kPrimaryContainerWhiteGray(context: context),
            textSelectedColor: kPrimaryWhite(context: context),
            textUnselectedColor: kOnPrimaryContainerBlackGray(context: context),
          ),
          CustomChoiceChipsMultiple(
            radius: 8,
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            itemPadding: EdgeInsets.symmetric(horizontal: 20.sp),
            list: [
              ChoiceChipsItemData(
                title: "item 0",
                isSelected: true,
                isEnabled: true,
                value: "My data 0",
              ),
              ChoiceChipsItemData(
                title: "item 1",
                isSelected: true,
                isEnabled: true,
                value: "My data 1",
              ),
              ChoiceChipsItemData(
                title: "item 2",
                isSelected: true,
                isEnabled: true,
                value: "My data 2",
              ),
            ],
            onSelected: (ChoiceChipsItemData item) {

            },
            backgroundSelectedColor: AppColors.pink,
            backgroundUnselectedColor: kPrimaryWhite(context: context),
            backgroundDisabledColor: kPrimaryWhite(context: context),
            borderSelectedColor: AppColors.pink,
            borderUnselectedColor: kPrimaryContainerWhiteGray(context: context),
            textSelectedColor: kPrimaryWhite(context: context),
            textUnselectedColor: kOnPrimaryContainerBlackGray(context: context),
          )
        ],
      ),
    );
  }
}
