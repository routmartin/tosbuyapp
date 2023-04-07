import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../assets/app_styles.dart';

class HomeSliderViewIndicator extends StatelessWidget {
  final int imageSliderIndex;
  const HomeSliderViewIndicator({
    super.key,
    required this.imageSliderIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: 13.sp,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedSmoothIndicator(
          activeIndex: imageSliderIndex,
          count: 3,
          curve: Curves.easeInOut,
          effect: ExpandingDotsEffect(
            expansionFactor: 4,
            activeDotColor: kOnSecondaryWhite(
              context: context,
            ),
            dotColor: kSecondaryContainerBlackGray(
              context: context,
            ),
            dotHeight: 6.0.sp,
            dotWidth: 6.0.sp,
            spacing: 4.0.sp,
          ),
        ),
      ),
    );
  }
}
