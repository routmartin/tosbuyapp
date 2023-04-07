import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/cart_response.dart';
import '../../../../../component/view/custom_cached_image.dart';

class CartListViewItemCartStore extends StatelessWidget {
  final Cart cart;
  const CartListViewItemCartStore({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
      child: Row(
        children: [
          SizedBox(
            width: 22.sp,
            height: 22.sp,
            child: CustomCachedImage(
              imageUrl: cart.logo,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(width: 8.sp),
          Text(
            cart.storeName,
            style: kTextTitleBold(context: context),
          ),
        ],
      ),
    );
  }
}
