import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tostinh/assets/app_colors.dart';

class ProduuctFilterPriceRange extends StatefulWidget {
  const ProduuctFilterPriceRange({super.key});

  @override
  State<ProduuctFilterPriceRange> createState() =>
      ProduuctFilterPriceRangeState();
}

class ProduuctFilterPriceRangeState extends State<ProduuctFilterPriceRange> {
  double _minValue = 20;
  double _maxValue = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\$ ${_minValue.toStringAsFixed(0)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Text(
              "\$ ${_maxValue.toStringAsFixed(0)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        SizedBox(
          width: Get.width,
          child: CupertinoRangeSlider(
            activeColor: AppColors.pink,
            thumbColor: AppColors.pink,
            trackColor: AppColors.blackGray,
            minValue: _minValue,
            maxValue: _maxValue,
            min: 1.0,
            max: 100.0,
            onMinChanged: (minVal) {
              setState(() {
                _minValue = minVal.roundToDouble();
              });
            },
            onMaxChanged: (maxVal) {
              setState(() {
                _maxValue = maxVal;
              });
            },
          ),
        ),
      ],
    );
  }
}
