import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_bottom_sheets/my_order_details_bottom_sheets_view_add_photos.dart';
import 'package:tostinh/presentation/feature/my_order_details/view/widget/my_order_details_bottom_sheets/my_order_details_bottom_sheets_view_item_photos_review.dart';

class MyOrderReviewProductAddPhotosSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _MyOrderReviewProductAddPhotosSectionState();
}

class _MyOrderReviewProductAddPhotosSectionState
    extends State<MyOrderReviewProductAddPhotosSection> {
  final ImagePicker _picker = ImagePicker();
  final scrollController = ScrollController();
  List<String> images = [];
  Future<void> pickImages() async {
    final result = await _picker.pickMultiImage();
    setState(() {
      result.forEach((element) {
        images.add(element.path);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Wrap(
        children: [
          ...images.map(
            (e) => Padding(
              padding: EdgeInsets.only(right: 16.sp),
              child: MyOrderDetailsBottomSheetsViewItemPhotosReview(
                onPressed: () {
                  OpenFilex.open(e);
                },
                imagePath: e,
              ),
            ),
          ),
          MyOrderDetailsBottomSheetsViewAddPhotos(
            onPressed: () {
              pickImages();
            },
          ),
        ],
      ),
    );
  }
}
