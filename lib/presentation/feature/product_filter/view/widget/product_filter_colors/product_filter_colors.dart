import 'package:flutter/material.dart';

import '../prodcut_filter_type_wrapper.dart';
import 'product_filter_cicle_color.dart';

class ProductFilterColors extends StatelessWidget {
  const ProductFilterColors({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductFilterTypeWrapper(
      filterHeader: "Colors",
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          6,
          (index) => ProductFilterCicleColor(
            onSelect: (int value) {},
            isActive: false,
          ),
        ),
      ),
    );
  }
}
