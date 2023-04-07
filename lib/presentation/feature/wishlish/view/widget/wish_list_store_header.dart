import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';

import '../../../../../domain/entities/response/wishlist_responses.dart';

class WishlistStoreHeader extends StatelessWidget {
  const WishlistStoreHeader({Key? key, required this.store}) : super(key: key);

  final WishlistStores store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: CustomCachedImage(imageUrl: store.logo, fit: BoxFit.cover),
          ),
          SizedBox(width: 8.sp),
          Text(
            store.storeName ?? "N/A",
            style: kTextTitleBold(context: context),
          ),
        ],
      ),
    );
  }
}
