import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tostinh/assets/app_locals.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_filter_section/search_product_result_filter_view_filter_button.dart';
import 'package:tostinh/presentation/feature/search_product_result/view/widget/search_product_result_filter_section/search_product_result_filter_view_sort_bottom_sheet.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../assets/app_icons.dart';
import '../../../../assets/app_styles.dart';

class CustomProductFilterSection extends StatefulWidget {
  final Function() onFilter;
  final Function() onSort;
  final Function() onSwitchViewLayout;
  const CustomProductFilterSection({
    super.key,
    required this.onFilter,
    required this.onSort,
    required this.onSwitchViewLayout,
  });

  @override
  State<CustomProductFilterSection> createState() =>
      _CustomProductFilterSectionState();
}

class _CustomProductFilterSectionState
    extends State<CustomProductFilterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryWhite(context: context),
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchProductResultFilterViewFilterButton(
            onPressed: widget.onFilter,
            iconPath: AppIcons.filter,
            title: AppLocals.filter.tr,
          ),
          Expanded(
            child: SearchProductResultFilterViewFilterButton(
              onPressed: () {
                CustomDialog.showDialogBottomSheet(
                  title: "Sort by",
                  content: const SearchProductResultFilterViewSortBottomSheet(),
                );
              },
              iconPath: AppIcons.price,
              title: "${AppLocals.price.tr}: " "Lowest to hight",
            ),
          ),
          SearchProductResultFilterViewFilterButton(
            onPressed: () {
              widget.onSwitchViewLayout.call();
              _writeLayout();
              setState(() {});
            },
            iconPath: _validateIcon(),
            title: AppLocals.view.tr,
          ),
        ],
      ),
    );
  }

  _validateIcon() {
    final box = GetStorage();
    if (box.read('gridView') != null) {
      return box.read('gridView') ? AppIcons.viewList : AppIcons.viewGrid;
    }
    return AppIcons.viewList;
  }

  _writeLayout() {
    final box = GetStorage();
    if (box.read('gridView') != null) {
      return box.write('gridView', !box.read('gridView'));
    }
    box.write('gridView', true);
  }
}
