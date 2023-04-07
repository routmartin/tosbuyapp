import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../assets/app_styles.dart';
import 'category_type_button.dart';

class CategoryTypeSectionList extends StatelessWidget {
  const CategoryTypeSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryWhite(context: context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(width: 12.sp),
          ...List.generate(
            10,
            (index) => CategoryTypeButton(
              action: () {},
              isActive: _checkIfButtonIsActive(index),
            ),
          ),
        ]),
      ),
    );
  }

  _checkIfButtonIsActive(int index) {
    return index == 0 ? true : false;
  }
}
