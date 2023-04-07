import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_styles.dart';

class ProductDetailAppBarViewTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  ProductDetailAppBarViewTabBar({required this.tabBar});

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Container(
      color: kPrimaryWhite(context: context),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
