import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product_result/controller/search_product_result_controller.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_locals.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/view/custom_button_circle.dart';

class SearchProductResultAppBar extends StatelessWidget {
  final SearchProductResultController controller;
  const SearchProductResultAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36.sp,
      child: Row(
        children: [
          _buildBackButton(context: context),
          _buildTextField(context: context),
        ],
      ),
    );
  }

  Widget _buildBackButton({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: CustomButtonCircle(
        onPressed: () {
          Get.back();
        },
        buttonSize: 36.sp,
        child: SvgPicture.asset(
          AppIcons.back,
          color: kOnPrimaryContainerBlackGray(context: context),
        ),
      ),
    );
  }

  Widget _buildTextField({required BuildContext context}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 16.sp),
        child: TextFormField(
          controller: controller.searchTextEditController,
          onTap: () {
            Get.back();
          },
          readOnly: true,
          decoration: kInputDecorationOutline(context: context)?.copyWith(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: 16.sp),
            fillColor: kPrimaryWhite(context: context),
            filled: true,
            enabledBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppColors.pink,
              ),
            ),
            focusedBorder: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppColors.pink,
              ),
            ),
            hintText: AppLocals.searchProducts.tr,
            hintStyle: kTextDescriptionBold(context: context)?.copyWith(
              color: kOnPrimaryContainerBlackGray(context: context),
            ),
            suffixIcon: CustomButtonCircle(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                AppIcons.camera,
                color: kOnPrimaryContainerBlackGray(context: context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
