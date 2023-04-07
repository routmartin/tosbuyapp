import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/component/view/custom_app_bar.dart';
import 'package:tostinh/presentation/feature/wishlish/controller/wishlisth_controller.dart';
import 'package:tostinh/presentation/feature/wishlish/view/widget/wishlist_store_item.dart';

import '../../../../assets/app_styles.dart';
import '../../../component/view/custom_request_indicator.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlishController>(
      init: WishlishController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: CustomAppBar(
          onTapLeft: () => Get.back(),
          title: AppLocals.wishList.tr,
          elevation: 0,
        ),
        body: CustomRequestIndicator(
          controller: controller.requestController,
          onLoad: controller.getWishlists,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: 10.sp),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => WishListStoreItem(
                      store: controller.stores[index],
                    ),
                    childCount: controller.stores.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
