import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../assets/app_styles.dart';
import '../model/choice_chips_item_data.dart';

class CustomChoiceChipsSingle extends StatefulWidget {
  final Color backgroundSelectedColor;
  final Color backgroundUnselectedColor;
  final Color? backgroundDisabledColor;
  final Color borderSelectedColor;
  final Color borderUnselectedColor;
  final Color? borderDisabledColor;
  final Color textSelectedColor;
  final Color textUnselectedColor;
  final Color? textDisabledColor;
  final EdgeInsetsGeometry? itemPadding;
  final double? radius;
  final double? spacing;
  final double? runSpacing;
  final List<ChoiceChipsItemData> list;
  final Function(ChoiceChipsItemData appChoiceChipData)? onSelected;

  const CustomChoiceChipsSingle({
    super.key,
    required this.backgroundSelectedColor,
    required this.backgroundUnselectedColor,
    this.backgroundDisabledColor,
    required this.borderSelectedColor,
    required this.borderUnselectedColor,
    this.borderDisabledColor,
    required this.textSelectedColor,
    required this.textUnselectedColor,
    this.textDisabledColor,
    this.itemPadding,
    this.radius,
    this.spacing,
    this.runSpacing,
    required this.list,
    this.onSelected,
  });

  @override
  State<CustomChoiceChipsSingle> createState() =>
      _CustomChoiceChipsSingleState();
}

class _CustomChoiceChipsSingleState extends State<CustomChoiceChipsSingle> {
  Color get backgroundSelectedColor => widget.backgroundSelectedColor;

  Color get backgroundUnselectedColor => widget.backgroundUnselectedColor;

  Color? get backgroundDisabledColor => widget.backgroundDisabledColor;

  Color get borderSelectedColor => widget.borderSelectedColor;

  Color get borderUnselectedColor => widget.borderUnselectedColor;

  Color? get borderDisabledColor => widget.borderDisabledColor;

  Color get textSelectedColor => widget.textSelectedColor;

  Color get textUnselectedColor => widget.textUnselectedColor;

  Color? get textDisabledColor => widget.textDisabledColor;

  List<ChoiceChipsItemData> get list => widget.list;

  EdgeInsetsGeometry? get itemPadding => widget.itemPadding;

  double? get radius => widget.radius;
  double get spacing => widget.spacing ?? 0.0;
  double get runSpacing => widget.runSpacing ?? 0.0;

  Function(ChoiceChipsItemData appChoiceChipData)? get onSelected =>
      widget.onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: List<Widget>.generate(
        list.length,
        (int index) {
          final item = list[index];
          return RawChip(
            side: BorderSide(width: 0.4.sp),
            padding: itemPadding,
            isEnabled: item.isEnabled,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            showCheckmark: false,
            disabledColor: backgroundDisabledColor,
            selectedColor: backgroundSelectedColor,
            backgroundColor: backgroundUnselectedColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              side: BorderSide(
                color: item.isEnabled
                    ? (item.isSelected == true
                        ? borderSelectedColor
                        : borderUnselectedColor)
                    : borderDisabledColor ?? Colors.transparent,
              ),
            ),
            label: Text(
              item.title,
              style: kTextDescriptionNormal(context: context)?.copyWith(
                color: item.isEnabled
                    ? (item.isSelected == true
                        ? textSelectedColor
                        : textUnselectedColor)
                    : textDisabledColor,
              ),
            ),
            selected: item.isSelected == true,
            onSelected: (bool selected) {
              setState(() {
                for (var element in list) {
                  element.isSelected = false;
                }
                item.isSelected = true;
              });
              onSelected?.call(item);
            },
          );
        },
      ).toList(),
    );
  }
}
