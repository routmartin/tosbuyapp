import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tostinh/presentation/feature/search_product/view/view_logic/search_product_suffix_type.dart';

class SearchProductController extends GetxController {
  final TextEditingController searchTextEditController =
      TextEditingController();

  SearchProductSuffixType searchProductSuffixType =
      SearchProductSuffixType.camera;
  void clearSearchText() {
    searchTextEditController.clear();
  }

  void changeSuffixType(SearchProductSuffixType type) {
    searchProductSuffixType = type;
    update();
  }

  void onSearchChange(String text) {
    if (text.trim() != "") {
      changeSuffixType(SearchProductSuffixType.clear);
    } else {
      changeSuffixType(SearchProductSuffixType.camera);
    }
  }
}
