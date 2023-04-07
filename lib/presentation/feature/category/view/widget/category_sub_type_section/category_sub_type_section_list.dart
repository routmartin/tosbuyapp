import 'package:flutter/material.dart';

import 'category_sub_type_rounded_button.dart';

class CategorySubTypeSectionList extends StatelessWidget {
  const CategorySubTypeSectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => CategorySubTypeRounedButton(
                action: () {},
                isActive: _checkIfButtonIsActive(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _checkIfButtonIsActive(int index) {
    return index == 0 ? true : false;
  }
}
