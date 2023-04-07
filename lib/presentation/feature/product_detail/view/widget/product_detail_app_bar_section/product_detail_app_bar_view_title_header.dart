import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';

class ProductDetailAppBarViewTitleHeader extends StatelessWidget {
  final String text;
  const ProductDetailAppBarViewTitleHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final deltaExtent = settings!.maxExtent - settings.minExtent;
    final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
            .clamp(0.0, 1.0);
    return LayoutBuilder(builder: (context, constraints) {
      return Visibility(
        visible: t == 1.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kToolbarHeight + 16.sp),
          child: Text(
            text,
            maxLines: 1,
            style: kTextHeadline3(context: context),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    });
  }
}
