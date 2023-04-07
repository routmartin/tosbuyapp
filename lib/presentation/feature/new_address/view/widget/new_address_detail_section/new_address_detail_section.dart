import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../component/view/custom_button_linear.dart';
import '../../../controller/new_address_controller.dart';
import '../new_address_view/new_address_view_form.dart';

class NewAddressDetailSection extends StatelessWidget {
  final NewAddressController controller;

  const NewAddressDetailSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.sp),
          topRight: Radius.circular(34.sp),
        ),
        color: kPrimaryWhite(context: context),
        boxShadow: [
          BoxShadow(
            color: kOnPrimaryBlack(context: context).withOpacity(.12.sp),
            spreadRadius: 1.sp,
            blurRadius: 7.sp,
            offset: Offset(0.sp, -4.sp),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60.sp,
              height: 6.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.sp),
                color: kOnPrimaryContainerBlackGray(context: context),
              ),
            ),
          ),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                NewAddressViewForm(
                  controller: controller.nameAddressController,
                  label: AppLocals.addressName.tr,
                  errorMsg: AppLocals.addressEnterName.tr,
                ),
                NewAddressViewForm(
                  controller: controller.phoneNumberController,
                  label: AppLocals.addressPhone.tr,
                  errorMsg: AppLocals.addressEnterPhone.tr,
                  inputType: TextInputType.phone,
                ),
                NewAddressViewForm(
                  controller: controller.addressDetailsController,
                  label: AppLocals.addressDetail.tr,
                  errorMsg: AppLocals.addressEnterDetail.tr,
                  isEnable: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.sp),
            child: Row(
              children: [
                SizedBox(
                  height: 22.sp,
                  width: 22.sp,
                  child: Checkbox(
                    activeColor: AppColors.pink,
                    shape: const CircleBorder(),
                    value: controller.isDefaultAddress,
                    onChanged: (value) => controller.markDefaultAddress(),
                  ),
                ),
                SizedBox(width: 4.sp),
                GestureDetector(
                  onTap: () => controller.markDefaultAddress(),
                  child: Text(
                    AppLocals.addressDefault.tr,
                    style: kTextHelperNormal1(context: context),
                  ),
                ),
              ],
            ),
          ),
          if (controller.address != null)
            Column(
              children: [
                CustomButtonLinear(
                  width: MediaQuery.of(context).size.width,
                  height: 50.sp,
                  onPressed: () => controller.deleteAddress(),
                  borderColor: AppColors.red,
                  borderSize: 1.sp,
                  backgroundColor: kPrimaryWhite(context: context),
                  borderRadius: 16.sp,
                  child: Text(
                    AppLocals.addressDelete.tr,
                    style: kTextTitleBold(context: context)?.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                ),
                SizedBox(height: 10.sp)
              ],
            ),
          CustomButtonLinear(
            width: MediaQuery.of(context).size.width,
            height: 50.sp,
            onPressed: () {
              if (controller.formKey.currentState?.validate() == true) {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.address != null
                    ? controller.updateAddress()
                    : controller.createAddress();
              }
            },
            backgroundColor: kOnPrimaryBlack(context: context),
            borderRadius: 16.sp,
            child: Text(
              controller.address != null
                  ? AppLocals.addressUpdate.tr
                  : AppLocals.addressAdd.tr,
              style: kTextTitleBold(context: context)?.copyWith(
                color: kPrimaryWhite(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
