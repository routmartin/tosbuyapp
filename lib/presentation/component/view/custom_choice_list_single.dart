import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/model/choice_list_item_data.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';

class CustomChoiceListSingle extends StatefulWidget {
  final Color backgroundSelectedColor;
  final Color backgroundUnselectedColor;
  final List<ChoiceListItemData> list;
  final Function(ChoiceListItemData itemData) onPressed;
  const CustomChoiceListSingle({
    Key? key,
    required this.backgroundSelectedColor,
    required this.backgroundUnselectedColor,
    required this.list,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomChoiceListSingle> createState() => _CustomChoiceListSingleState();
}

class _CustomChoiceListSingleState extends State<CustomChoiceListSingle> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: _buildItem,
      itemCount: widget.list.length,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final item = widget.list[index];
    return CustomButtonLinear(
      width: double.infinity,
      height: 50.sp,
      backgroundColor: item.isSelected == false
          ? widget.backgroundUnselectedColor
          : widget.backgroundSelectedColor,
      onPressed: () {
        setState(() {
          for (var element in widget.list) {
            element.isSelected = false;
          }
          item.isSelected = !item.isSelected;
          widget.onPressed.call(item);
        });
      },
      child: Text(
        widget.list[index].title,
        style: kTextDescriptionBold(context: context)?.copyWith(
          color: item.isSelected == false
              ? kOnSurfaceBlack(context: context)
              : kOnInverseSurfaceWhite(context: context),
        ),
      ),
    );
  }
}
