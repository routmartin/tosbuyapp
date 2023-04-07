import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tostinh/presentation/component/view/custom_button_linear.dart';
import 'package:tostinh/presentation/feature/notification/controller/notification_controller.dart';

class NotificationViewItemInfo extends StatelessWidget {
  final NotificationController controller;
  final int index;
  final Animation<double> animation;

  const NotificationViewItemInfo(
      {super.key,
      required this.controller,
      required this.index,
      required this.animation});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Column(
        children: [
          SizedBox(height: 10.sp,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp,),
            child: Slidable(
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(controller.notifications[index]),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      controller.onPressedDelete(index);
                    },
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: CustomButtonLinear(
                onPressed: () {},
                child: Container(
                  height: 60.sp,
                  color: Colors.amber,
                  width: double.infinity,
                  child: Text(controller.notifications[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
