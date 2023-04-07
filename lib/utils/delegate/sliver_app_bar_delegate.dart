import 'dart:math' as math;

import 'package:flutter/material.dart';

typedef ItemPersistentBuild = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.itemPersistentBuild,
  });

  final double minHeight;
  final double maxHeight;
  final ItemPersistentBuild itemPersistentBuild;

  late Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    child = itemPersistentBuild.call(context, shrinkOffset, overlapsContent);
    return child;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
