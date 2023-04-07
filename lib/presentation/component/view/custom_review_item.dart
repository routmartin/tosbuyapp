import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../assets/app_colors.dart';
import '../../../assets/app_styles.dart';
import '../../../domain/entities/response/product_review_response.dart';
import '../model/choice_chips_item_data.dart';
import 'custom_cached_image.dart';
import 'custom_choice_chips_single.dart';

class CustomReviewItem extends StatelessWidget {
  final ReviewData reviewData;
  const CustomReviewItem({super.key, required this.reviewData});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSurfaceWhite(context: context),
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: Container(
        color: kSurfaceVariantWhiteGray(context: context),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 32.sp,
                          height: 32.sp,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: CustomCachedImage(
                            imageUrl: reviewData.customer.image ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.sp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${reviewData.customer.firstName} ${reviewData.customer.lastName}",
                              style: kTextDescriptionBold(context: context),
                            ),
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: AppColors.yellow,
                              ),
                              rating: reviewData.rating,
                              itemCount: 5,
                              itemSize: 13.0.sp,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text("August 13, 2019",
                      style: kTextHelperNormal2(context: context)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              alignment: Alignment.centerLeft,
              child: Text(
                reviewData.description,
                style: kTextDescriptionNormal(context: context),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.sp),
              child: ReviewItemMedia(imageUrl: reviewData.media),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Was This Review Helpful?",
                      style: kTextHelperNormal2(context: context),
                    ),
                  ),
                  CustomChoiceChipsSingle(
                    backgroundSelectedColor: AppColors.pink,
                    backgroundUnselectedColor: kSurfaceWhite(context: context),
                    borderSelectedColor: AppColors.pink,
                    borderUnselectedColor: kOnSurfaceVariantBlackGray(
                      context: context,
                    ),
                    textSelectedColor: kOnInverseSurfaceWhite(context: context),
                    textUnselectedColor: kOnSurfaceVariantBlackGray(
                      context: context,
                    ),
                    radius: 6,
                    spacing: 10.sp,
                    list: [
                      ChoiceChipsItemData(
                        title: "Yes",
                        isSelected: false,
                        isEnabled: true,
                      ),
                      ChoiceChipsItemData(
                        title: "No",
                        isSelected: false,
                        isEnabled: true,
                      ),
                    ],
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

class ReviewStar extends StatelessWidget {
  final int count;

  const ReviewStar({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: index == 0 ? 0.sp : 1.sp),
          child: Icon(Icons.star, color: AppColors.yellow, size: 14.sp),
        ),
      ),
    );
  }
}

class ReviewItemMedia extends StatelessWidget {
  final List<String> imageUrl;
  const ReviewItemMedia({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.sp,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        separatorBuilder: (context, index) {
          return SizedBox(width: 10.sp);
        },
        itemBuilder: (context, index) {
          return SizedBox(
            width: 104.sp,
            child: CustomCachedImage(
              imageUrl: imageUrl[index],
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(8.0),
            ),
          );
        },
        itemCount: imageUrl.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
