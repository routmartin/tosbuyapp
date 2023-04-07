import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/feature/search_product_result/controller/search_product_result_controller.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_filter_section/search_product_result_filter_view_filter_button.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_filter_section/search_product_result_filter_view_sort_bottom_sheet.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../assets/app_icons.dart';

class SearchProductResultFilterSection extends StatelessWidget {
  final SearchProductResultController controller;
  const SearchProductResultFilterSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchProductResultFilterViewFilterButton(
            onPressed: () {},
            iconPath: AppIcons.filter,
            title: AppLocals.filter.tr,
          ),
          SearchProductResultFilterViewFilterButton(
            onPressed: () {
              CustomDialog.showDialogBottomSheet(
                title: "Sort by",
                content: const SearchProductResultFilterViewSortBottomSheet(),
              );
            },
            iconPath: AppIcons.price,
            title: "${AppLocals.price.tr}: " "Lowest to hight",
          ),
        ],
      ),
    );
  }
}
