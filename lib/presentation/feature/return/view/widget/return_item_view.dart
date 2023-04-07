import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../assets/app_styles.dart';
import '../../../../component/view/custom_cached_image.dart';
import 'return_action_button.dart';

class ReturnItemView extends StatelessWidget {
  const ReturnItemView({super.key, required this.itemIndex});
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryWhite(context: context),
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 16.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: SizedBox(
                  width: 100.sp,
                  height: 100.sp,
                  child: const CustomCachedImage(
                    imageUrl:
                        'https://media.istockphoto.com/id/1303978937/photo/white-sneaker-on-a-blue-gradient-background-mens-fashion-sport-shoe-sneakers-lifestyle.jpg?s=612x612&w=0&k=20&c=L725fuzFTnm6qEaqE7Urc5q6IR80EgYQEjBn_qtBIQg=',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BES875UK The Barista Espresso Coffee",
                      style: kTextDescriptionBold(context: context),
                    ),
                    SizedBox(height: 7.sp),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        color: kPrimaryContainerWhiteGray(context: context),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Black, Size 43, Man",
                        style: kTextHelperNormal2(context: context)?.copyWith(
                          color: kOnPrimaryContainerBlackGray(
                            context: context,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    Text(
                      "\$96.00",
                      style: kTextTitleBold(context: context),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10.sp),
          if (itemIndex == 1) const ReturnActionButton()
        ],
      ),
    );
  }
}
