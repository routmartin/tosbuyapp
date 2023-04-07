import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_styles.dart';
import 'package:tostinh/presentation/component/view/custom_request_indicator.dart';
import 'package:tostinh/presentation/component/view/custom_sliver_paging.dart';
import 'package:tostinh/presentation/feature/notification/controller/notification_controller.dart';
import 'package:tostinh/presentation/feature/notification/view/widget/notification_view/notifcation_view_item_info.dart';

class NotificationBody extends StatelessWidget {
  final NotificationController controller;
  const NotificationBody({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryContainerWhiteGray(context: context),
      child: CustomRequestIndicator(
        controller: controller.requestController,
        onLoad: controller.requestNotifications,
        child: CustomScrollView(
          slivers: [
            SliverAnimatedList(
              key: controller.listState,
              initialItemCount: controller.notifications.length,
              itemBuilder: (context, index, animation) =>
                  NotificationViewItemInfo(
                controller: controller,
                index: index,
                animation: animation,
              ),
            ),
            CustomSliverPaging(
              controller: controller.requestController,
              onLoadMore: controller.requestMoreNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
