import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_locals.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../../domain/entities/response/address_response.dart';
import '../../../../component/view/custom_button_circle.dart';
import '../../controller/address_controller.dart';

class AddressViewItem extends StatelessWidget {
  final AddressController controller;
  final Address address;

  const AddressViewItem({
    Key? key,
    required this.controller,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.isSelectShippingAddress != null) {
          controller.onSelectedAddress(address);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: kPrimaryWhite(context: context),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppIcons.locationFill),
            SizedBox(width: 16.sp),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address.label ?? "",
                        style: kTextHeadline3(context: context),
                      ),
                      SizedBox(width: 6.sp),
                      address.isDefault == true
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.sp,
                                vertical: 4.sp,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.sp),
                                color: kPrimaryContainerWhiteGray(
                                    context: context),
                              ),
                              child: Text(
                                AppLocals.addressDefaultLabel.tr,
                                style: kTextHelperNormal1(context: context),
                              ),
                            )
                          : Container()
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Text(
                      address.phone ?? "",
                      style: kTextHelperNormal1(context: context),
                    ),
                  ),
                  Text(
                    address.addressDetail,
                    style: kTextHelperNormal1(context: context)?.copyWith(
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                  )
                ],
              ),
            ),
            CustomButtonCircle(
              onPressed: () => controller.navigateNewAddress(data: address),
              child: const Icon(Icons.edit_location_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
