import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../assets/app_colors.dart';
import '../../../../../assets/app_styles.dart';

class ProductFilterRectangleChild extends StatefulWidget {
  const ProductFilterRectangleChild({
    Key? key,
    required this.label,
    required this.isActive,
    required this.width,
    this.height,
    required this.onSelect,
  }) : super(key: key);

  final String label;
  final bool isActive;
  final double width;
  final double? height;
  final Function(dynamic value) onSelect;

  @override
  State<ProductFilterRectangleChild> createState() =>
      _ProductFilterRectangleChildState();
}

class _ProductFilterRectangleChildState
    extends State<ProductFilterRectangleChild> {
  late bool isActive;

  @override
  initState() {
    isActive = widget.isActive;
    super.initState();
  }

  _onSelectedTap() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onSelectedTap,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 16.sp, bottom: 16.sp),
        decoration: BoxDecoration(
          border: Border.all(
            width: .4,
            color: kOnSurfaceVariantBlackGray(context: context),
          ),
          color: isActive ? AppColors.pink : Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        width: widget.width,
        height: widget.height ?? 40.sp,
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: isActive
                    ? kSurfaceWhite(context: context)
                    : kSecondaryBlack(context: context),
              ),
        ),
      ),
    );
  }
}
