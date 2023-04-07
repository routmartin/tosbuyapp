import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_colors.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/model/choice_list_item_data.dart';
import 'package:tostinh/presentation/component/view/custom_choice_list_single.dart';
import 'package:tostinh/presentation/component/view/custom_dialog.dart';

class CustomProductFilterViewSortBottomSheet extends StatelessWidget {
  const CustomProductFilterViewSortBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSurfaceWhite(context: context),
      child: CustomChoiceListSingle(
        backgroundSelectedColor: AppColors.pink,
        backgroundUnselectedColor: kSurfaceWhite(context: context),
        list: [
          ChoiceListItemData(
            title: "Sort 1",
            isSelected: true,
            value: null,
          ),
          ChoiceListItemData(
            title: "Sort 1",
            isSelected: false,
            value: null,
          ),
        ],
        onPressed: (ChoiceListItemData itemData) {
          Future.delayed(const Duration(milliseconds: 200), () {
            CustomDialog.closeDialog();
          });
        },
      ),
    );
  }
}
