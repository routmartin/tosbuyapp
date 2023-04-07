import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tostinh/domain/entities/response/products_response.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';

class SearchProductResultController extends GetxController {
  final searchTextEditController = TextEditingController();
  final RequestIndicatorController requestIndicatorController =
      RequestIndicatorController();
  List<ProductData> products = [];

  @override
  void onInit() {
    searchTextEditController.text = "Search title";
    super.onInit();
  }
}
