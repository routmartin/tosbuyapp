import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../assets/app_colors.dart';

class ProductFilterCicleColor extends StatefulWidget {
  const ProductFilterCicleColor({
    Key? key,
    required this.isActive,
    required this.onSelect,
  }) : super(key: key);

  final bool isActive;
  final Function(int value) onSelect;

  @override
  State<ProductFilterCicleColor> createState() =>
      _ProductFilterCicleColorState();
}

class _ProductFilterCicleColorState extends State<ProductFilterCicleColor> {
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
      onTap: () => _onSelectedTap(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isActive)
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              alignment: Alignment.center,
              width: 50.sp,
              height: 50.sp,
              margin: EdgeInsets.only(right: 24.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColors.pink),
              ),
            ),
          AnimatedAlign(
            duration: Duration(milliseconds: 300),
            alignment: Alignment.center,
            child: Container(
              width: 40.sp,
              height: 40.sp,
              margin: EdgeInsets.only(right: 24.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0XFFE2BB8D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
