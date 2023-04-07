import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';
import 'package:tostinh/presentation/feature/notification/view/widget/notification_view/notifcation_view_item_info.dart';

class NotificationController extends GetxController {
  final requestController = RequestIndicatorController();
  List<String> notifications = [];
  GlobalKey<SliverAnimatedListState> listState = GlobalKey();

  List<String> fakeNotifications() {
    List<String> notifications = [];
    for (var i = requestController.offset; i < requestController.offset + requestController.limit; i++) {
      notifications.add("value $i");
    }
    return notifications;
  }


  void onPressedDelete(int index) {
    notifications.removeAt(index);
    listState.currentState?.removeItem(
      index,
      (context, animation) => NotificationViewItemInfo(
        controller: this,
        index: index,
        animation: animation,
      ),
    );
  }

  Future<RequestIndicatorState> requestNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    listState = GlobalKey();
    notifications = fakeNotifications();
    update();
    return RequestIndicatorState.success;
  }

  Future<PagingState> requestMoreNotifications() async {
    var lastIndex = notifications.length;
    var moreNotification = fakeNotifications();
    await Future.delayed(const Duration(seconds: 1));
    notifications.addAll(moreNotification);
    moreNotification.asMap().forEach((index, value) {
      var itemIndex = lastIndex + index - 1;
      listState.currentState?.insertItem(itemIndex, duration: Duration.zero);
    });
    return PagingState.success;
  }
}
