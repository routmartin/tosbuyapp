import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../assets/app_icons.dart';

class MyOrderReviewProductRatingSection extends StatelessWidget {
  const MyOrderReviewProductRatingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RatingBar(
        initialRating: 3,
        direction: Axis.horizontal,
        allowHalfRating: true,
        minRating: 0,
        itemCount: 5,
        ratingWidget: RatingWidget(
          full: SvgPicture.asset(
            AppIcons.fullStar,
            width: 10.sp,
            height: 10.sp,
          ),
          half: SvgPicture.asset(
            AppIcons.halfStar,
            width: 10.sp,
            height: 10.sp,
          ),
          empty: SvgPicture.asset(
            AppIcons.emptyStar,
            width: 10.sp,
            height: 10.sp,
          ),
        ),
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
