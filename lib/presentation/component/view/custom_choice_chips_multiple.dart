import 'package:flutter/material.dart';

import '../../../assets/app_styles.dart';
import '../model/choice_chips_item_data.dart';

class CustomChoiceChipsMultiple extends StatefulWidget {
  final Color backgroundSelectedColor;
  final Color backgroundUnselectedColor;
  final Color? backgroundDisabledColor;
  final Color borderSelectedColor;
  final Color borderUnselectedColor;
  final Color? borderDisabledColor;
  final Color textSelectedColor;
  final Color textUnselectedColor;
  final Color? textDisabledColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? itemPadding;
  final double? radius;
  final List<ChoiceChipsItemData> list;
  final Function(ChoiceChipsItemData appChoiceChipData)? onSelected;

  const CustomChoiceChipsMultiple(
      {super.key,
      required this.backgroundSelectedColor,
      required this.backgroundUnselectedColor,
      this.backgroundDisabledColor,
      required this.borderSelectedColor,
      required this.borderUnselectedColor,
      this.borderDisabledColor,
      required this.textSelectedColor,
      required this.textUnselectedColor,
      this.textDisabledColor,
      this.padding,
      this.itemPadding,
      this.radius,
      required this.list,
      this.onSelected});

  @override
  State<CustomChoiceChipsMultiple> createState() =>
      _CustomChoiceChipsMultipleState();
}

class _CustomChoiceChipsMultipleState extends State<CustomChoiceChipsMultiple> {
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

  EdgeInsetsGeometry? get padding => widget.padding;

  EdgeInsetsGeometry? get itemPadding => widget.itemPadding;

  double? get radius => widget.radius;

  Function(ChoiceChipsItemData appChoiceChipData)? get onSelected =>
      widget.onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        list.length,
        (int index) {
          final item = list[index];
          return Padding(
            padding: padding ?? EdgeInsets.zero,
            child: RawChip(
              padding: itemPadding,
              isEnabled: item.isEnabled,
              showCheckmark: false,
              disabledColor: backgroundDisabledColor,
              selectedColor: backgroundSelectedColor,
              backgroundColor: backgroundUnselectedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0),
                side: BorderSide(
                  color: item.isEnabled
                      ? item.isSelected == true
                          ? borderSelectedColor
                          : borderUnselectedColor
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
                  item.isSelected = selected;
                });
                onSelected?.call(item);
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
