import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../../../assets/app_locals.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/store_response.dart';
import '../../../../../component/view/custom_button_linear.dart';
import '../../../../../component/view/custom_cached_image.dart';
import '../../../controller/store_controller.dart';
import 'store_list_view_follow_button.dart';

class StoreListViewItemStore extends StatelessWidget {
  final StoreController controller;
  final Store item;

  const StoreListViewItemStore({
    Key? key,
    required this.controller,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      child: CustomButtonLinear(
        onPressed: () => Get.toNamed(AppRoutes.storeDetail, arguments: item.id),
        borderSize: 100,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: CustomCachedImage(
                imageUrl: item.cover,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(14.sp),
              child: Row(
                children: [
                  SizedBox(
                    width: 32.sp,
                    height: 32.sp,
                    child: CustomCachedImage(
                      imageUrl: item.logo,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: Text(
                      item.name,
                      style: kTextTitleBold(context: context),
                    ),
                  ),
                  StoreListViewFollowButton(
                    label: item.isFollower == true
                        ? AppLocals.storeUnfollow.tr
                        : AppLocals.storeFollow.tr,
                    onPressed: () => item.isFollower == true
                        ? controller.unfollow(item.id)
                        : controller.follow(item.id),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
