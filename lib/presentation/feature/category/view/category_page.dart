import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/component/view/custom_product_filter_section/custom_product_filter_section.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/feature/category/controller/category_controller.dart';
import 'package:tostinh/presentation/feature/category/view/widget/category_product_list_layout_switcher/category_product_list_layout_switcher.dart';
import 'package:tostinh/routes/app_routes.dart';

import '../../../../assets/app_locals.dart';
import '../../../../assets/app_styles.dart';
import '../../../component/view/custom_app_bar.dart';
import '../../../component/view/custom_sliver_paging.dart';
import 'widget/category_sub_type_section/category_sub_type_section_list.dart';
import 'widget/category_type_section/category_type_section_list.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      builder: (controller) => Scaffold(
        backgroundColor: kPrimaryContainerWhiteGray(context: context),
        appBar: CustomAppBar(
          onTapLeft: () => Get.back(),
          title: AppLocals.category.tr,
          elevation: 0,
        ),
        body: Column(
          children: [
            const CategoryTypeSectionList(),
            CustomProductFilterSection(
              onFilter: () => Get.toNamed(AppRoutes.productFilter),
              onSort: () {},
              onSwitchViewLayout: controller.onSwtichViewLayout,
            ),
            SizedBox(height: 12.sp),
            Expanded(
              child: CustomRequestIndicator(
                controller: controller.requestIndicatorController,
                onLoad: controller.requestFirstProduct,
                child: CustomScrollView(
                  slivers: [
                    const CategorySubTypeSectionList(),
                    CategoryProdocutListSwitcher(controller: controller),
                    CustomSliverPaging(
                      controller: controller.requestIndicatorController,
                      onLoadMore: controller.requestMoreProduct,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
