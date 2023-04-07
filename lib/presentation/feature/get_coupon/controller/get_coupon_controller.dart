import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tostinh/presentation/component/model/choice_chips_item_data.dart';

class GetCouponController extends GetxController {
  final List<ChoiceChipsItemData> choiceChipsDatas = [];

  @override
  void onInit() {
    choiceChipsDatas.add(
      ChoiceChipsItemData(title: "Electric", isSelected: true, isEnabled: true),
    );
    choiceChipsDatas.add(
      ChoiceChipsItemData(title: "Fasion", isSelected: false, isEnabled: true),
    );
    super.onInit();
  }
}
