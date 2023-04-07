import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_slider_view_images.dart';
import 'home_slider_view_indicator.dart';

class HomeSliderSection extends StatefulWidget {
  const HomeSliderSection({super.key});

  @override
  State<StatefulWidget> createState() => _HomeSliderSectionState();
}

class _HomeSliderSectionState extends State<HomeSliderSection> {
  var imageSliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 6.sp),
        child: Stack(
          children: [
            HomeSliderViewImages(
              onPageChanged: (index) {
                setState(() {
                  imageSliderIndex = index;
                });
              },
              imageSliderIndex: imageSliderIndex,
            ),
            HomeSliderViewIndicator(
              imageSliderIndex: imageSliderIndex,
            ),
          ],
        ),
      ),
    );
  }
}
