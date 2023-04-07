import 'package:flutter/cupertino.dart';
import 'package:tostinh/presentation/feature/search_product_result/controller/search_product_result_controller.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_app_bar.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_filter_section/search_product_result_filter_section.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_product_list_section/search_product_result_product_list_section.dart';

class SearchProductResultBody extends StatelessWidget {
  final SearchProductResultController controller;
  const SearchProductResultBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchProductResultAppBar(controller: controller),
        SearchProductResultFilterSection(controller: controller),
        SearchProductResultProductListSection(controller: controller),
      ],
    );
  }
}
