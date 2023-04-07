import 'package:flutter/src/widgets/framework.dart';

import '../prodcut_filter_type_wrapper.dart';
import 'product_filter_price_rang.dart';

class ProductFilterPriceRange extends StatelessWidget {
  const ProductFilterPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductFilterTypeWrapper(
      filterHeader: "Price Range",
      child: ProduuctFilterPriceRange(),
    );
  }
}
