import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/wishlish/view/widget/wish_list_store_header.dart';

import '../../../../../assets/app_styles.dart';
import '../../../../../domain/entities/response/wishlist_responses.dart';
import 'wishlist_item_view.dart';

class WishListStoreItem extends StatelessWidget {
  const WishListStoreItem({super.key, required this.store});
  final WishlistStores store;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryWhite(context: context),
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      child: Column(
        children: [
          WishlistStoreHeader(store: store),
          Divider(
            color: kPrimaryContainerWhiteGray(context: context),
            thickness: 1.sp,
            height: 1.sp,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: store.product?.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              var wishlist = store.product?[index];
              return Column(
                children: [
                  WishListItemView(wishlist: wishlist!),
                  if (index != 2)
                    Divider(
                      height: 0.5.sp,
                      color: kOnPrimaryContainerBlackGray(context: context),
                    ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
