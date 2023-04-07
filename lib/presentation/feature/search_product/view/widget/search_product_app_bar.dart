import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product/controller/search_product_controller.dart';
import 'package:tostinh/presentation/feature/search_product/view/view_logic/search_product_suffix_type.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_locals.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/view/custom_button_circle.dart';
import '../../../../component/view/custom_button_linear.dart';

class SearchProductAppBar extends StatelessWidget {
  final SearchProductController controller;
  const SearchProductAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36.sp,
      child: Row(
        children: [
          _buildBackButton(context: context),
          _buildTextField(context: context),
          _buildSearchButton(context: context),
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

  Widget _validateSuffixType(
    BuildContext context,
    SearchProductSuffixType type,
  ) {
    switch (type) {
      case SearchProductSuffixType.camera:
        return CustomButtonCircle(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            AppIcons.camera,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
        );
      case SearchProductSuffixType.clear:
        return CustomButtonCircle(
          onPressed: () {
            controller.clearSearchText();
          },
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            AppIcons.clearInline,
            color: kOnPrimaryContainerBlackGray(context: context),
            width: 24.sp,
            height: 24.sp,
          ),
        );
    }
  }

  Widget _buildTextField({required BuildContext context}) {
    return Expanded(
      child: TextFormField(
        controller: controller.searchTextEditController,
        onTap: () {},
        onChanged: controller.onSearchChange,
        readOnly: false,
        decoration: kInputDecorationOutline(context: context)?.copyWith(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.sp),
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
          suffixIcon: _validateSuffixType(
            context,
            controller.searchProductSuffixType,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton({required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: CustomButtonLinear(
        onPressed: () {
          Get.toNamed(AppRoutes.searchProductResult);
        },
        height: 36.sp,
        width: 67.sp,
        backgroundColor: AppColors.pink,
        borderRadius: 30,
        child: Text(
          "Search",
          style: kTextDescriptionBold(context: context)?.copyWith(
            color: kOnSecondaryWhite(context: context),
          ),
        ),
      ),
    );
  }
}
