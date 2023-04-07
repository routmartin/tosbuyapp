import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/feature/product_filter/view/widget/prodcut_filter_type_wrapper.dart';

import '../product_filter_rectangle_child.dart';

class ProductFitlerSize extends StatelessWidget {
  const ProductFitlerSize({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductFilterTypeWrapper(
      filterHeader: "Sizes",
      child: Column(
        children: [
          Spacer(),
          Wrap(
            children: List.generate(
              6,
              (index) => ProductFilterRectangleChild(
                isActive: false,
                width: 40.sp,
                label: "XS",
                onSelect: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
