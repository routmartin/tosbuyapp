import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/product_filter/view/widget/prodcut_filter_type_wrapper.dart';

import '../product_filter_rectangle_child.dart';

class ProductFitlerCategory extends StatelessWidget {
  const ProductFitlerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductFilterTypeWrapper(
      filterHeader: "Category",
      height: 200.sp,
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: Get.width,
            child: Wrap(
              children: List.generate(
                6,
                (index) => ProductFilterRectangleChild(
                  isActive: false,
                  width: 85.sp,
                  label: "Women",
                  onSelect: (value) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
