import 'package:flutter/material.dart';
import 'package:tostinh/presentation/feature/category/controller/category_controller.dart';
import 'package:tostinh/presentation/feature/category/view/widget/category_product_list_layout_switcher/category_product_gridview_layout.dart';
import 'package:tostinh/presentation/feature/category/view/widget/category_product_list_layout_switcher/category_product_listview_layout.dart';

class CategoryProdocutListSwitcher extends StatelessWidget {
  final CategoryController controller;
  const CategoryProdocutListSwitcher({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.viewLayout == ViewLayout.grid
        ? CategoryProductGridViewLayout(controller: controller)
        : CategoryProductListViewLayout(controller: controller);
  }
}

enum ViewLayout {
  grid,
  list,
}
