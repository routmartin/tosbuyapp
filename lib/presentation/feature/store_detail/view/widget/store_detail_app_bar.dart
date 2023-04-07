import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_icons.dart';
import '../../../../../assets/app_locals.dart';
import '../../../../../assets/app_styles.dart';
import '../../../../component/view/custom_app_bar.dart';
import '../../../../component/view/custom_cached_image.dart';
import '../../../stores/view/widget/store_section/store_list_view_follow_button.dart';
import '../../controller/store_detail_controller.dart';

class StoreDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final StoreDetailController controller;
  const StoreDetailAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(
        margin: EdgeInsets.only(left: 16.sp),
        constraints: BoxConstraints(minWidth: 70.sp),
        alignment: Alignment.centerLeft,
        child: IconButtonAppBar(
          onPressed: () => Get.back(),
          child: SvgPicture.asset(
            AppIcons.back,
            color: kOnPrimaryContainerBlackGray(context: context),
          ),
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: Stack(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: CustomCachedImage(
                    imageUrl: controller.store?.cover ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        kOnPrimaryBlack(context: context),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 48.sp,
                  left: 0.sp,
                  right: 0.sp,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 10.sp,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 55.sp,
                          height: 55.sp,
                          child: CustomCachedImage(
                            imageUrl: controller.store?.logo ?? "",
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        SizedBox(width: 14.sp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.store?.name ?? "",
                                style:
                                    kTextHeadline3(context: context)?.copyWith(
                                  color: kPrimaryWhite(
                                    context: context,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.sp),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.officialStore),
                                    SizedBox(width: 5.sp),
                                    Text(
                                      "${controller.store?.totalFollower} ${AppLocals.storeFollower.tr}",
                                      style: kTextDescriptionNormal(
                                              context: context)
                                          ?.copyWith(
                                        color: kPrimaryWhite(context: context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AppIcons.rate),
                                  SizedBox(width: 5.sp),
                                  Text(
                                    "${controller.store?.totalRate} (${controller.store?.totalReview} Reviews)",
                                    style:
                                        kTextDescriptionBold(context: context)
                                            ?.copyWith(
                                      color: kPrimaryWhite(context: context),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        StoreListViewFollowButton(
                          label: controller.store?.isFollower == true
                              ? AppLocals.storeUnfollow.tr
                              : AppLocals.storeFollow.tr,
                          onPressed: () => controller.store?.isFollower == true
                              ? controller.unfollow()
                              : controller.follow(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          color: kPrimaryWhite(context: context),
          child: TabBar(
            controller: controller.tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: kTextTitleBold(context: context),
            indicatorColor: AppColors.pink,
            tabs: [
              Tab(text: AppLocals.storeHome.tr),
              Tab(text: AppLocals.storePromotion.tr),
              Tab(text: AppLocals.storeBestSale.tr),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(250.sp);
}
