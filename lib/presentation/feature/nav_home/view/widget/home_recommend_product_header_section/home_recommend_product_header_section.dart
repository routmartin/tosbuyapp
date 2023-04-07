import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';
import '../../../../../../utils/delegate/sliver_app_bar_delegate.dart';

class HomeRecommendProductHeaderSection extends StatelessWidget {
  const HomeRecommendProductHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50.sp,
        maxHeight: 50.sp,
        itemPersistentBuild: (context, shrinkOffset, overlapsContent) {

          if (overlapsContent) {
            return _buildHeader(
              context: context,
              color: kSurfaceWhite(context: context),
              elevation: 4,
            );
          } else {
            return _buildHeader(
              context: context,
              color: kSurfaceVariantWhiteGray(context: context),
              elevation: 0,
            );
          }
        },
      ),
    );
  }

  Widget _buildHeader(
      {required BuildContext context,
      required Color color,
      required double elevation}) {
    return Material(
      elevation: elevation,
      child: Container(
        alignment: Alignment.centerLeft,
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: Text(
          "Recommend",
          style: kTextTitleBold(context: context),
        ),
      ),
    );
  }
}
