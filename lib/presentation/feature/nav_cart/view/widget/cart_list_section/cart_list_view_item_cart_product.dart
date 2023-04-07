import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tostinh/presentation/component/view/custom_cached_image.dart';
import 'package:tostinh/presentation/feature/nav_cart/view/widget/cart_list_section/cart_list_view_item_cart_product_variant.dart';
import 'package:tostinh/utils/extenstion/dialog_extension.dart';

import '../../../../../../assets/app_colors.dart';
import '../../../../../../assets/app_styles.dart';
import '../../../../../../domain/entities/response/cart_response.dart';
import '../../../../../component/view/custom_input_dialog.dart';
import '../../../controller/cart_controller.dart';

class CartListViewItemCartProduct extends StatelessWidget {
  final CartController controller;
  final int cartIndex;
  final int productIndex;
  final Product product;

  const CartListViewItemCartProduct({
    Key? key,
    required this.controller,
    required this.cartIndex,
    required this.productIndex,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.selectProduct(
        cartIndex: cartIndex,
        productIndex: productIndex,
        isSelect: !product.isSelected!,
      ),
      child: Container(
        color: product.isSelected == true
            ? ColorPinkVariant.light
            : kPrimaryWhite(context: context),
        padding: EdgeInsets.only(
          left: 10.sp,
          right: 16.sp,
          top: 10.sp,
          bottom: 10.sp,
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.sp,
                height: 30.sp,
                child: Checkbox(
                  value: product.isSelected,
                  onChanged: (value) => controller.selectProduct(
                    cartIndex: cartIndex,
                    productIndex: productIndex,
                    isSelect: value,
                  ),
                  shape: const CircleBorder(),
                  activeColor: ColorPinkVariant.normal,
                ),
              ),
              SizedBox(width: 8.sp),
              SizedBox(
                width: 100.sp,
                height: 100.sp,
                child: CustomCachedImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              SizedBox(width: 10.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: kTextDescriptionBold(context: context),
                          ),
                          SizedBox(height: 4.sp),
                          if (product.variants != null)
                            CartListViewItemCartProductVariant(
                                product: product),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${product.stockQty} available",
                        style: kTextHelperNormal1(context: context)?.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.sp),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "\$${product.prices.priceAfterDiscount.toStringAsFixed(2)}",
                            style: kTextTitleBold(context: context),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (product.qty > 1)
                                  controller.updateQty(
                                    cartId: product.cartId,
                                    qty: -1,
                                  );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.sp),
                                  color: kOnPrimaryBlack(context: context),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: kPrimaryWhite(context: context),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                controller.qtyController.text =
                                    product.qty.toString();
                                showQuantityDialog(
                                  context: context,
                                  controller: controller,
                                  product: product,
                                );
                              },
                              child: SizedBox(
                                width: 50.sp,
                                child: Center(
                                  child: Text(
                                    "${product.qty}",
                                    style: kTextTitleBold(context: context),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => controller.updateQty(
                                cartId: product.cartId,
                                qty: 1,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.sp),
                                  color: kOnPrimaryBlack(context: context),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: kPrimaryWhite(context: context),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showQuantityDialog({
  required BuildContext context,
  required CartController controller,
  required Product product,
}) {
  CustomDialog.showDialogInput(
    title: "Enter Quantity",
    content: CustomInputDialog(
      controller: controller.qtyController,
      errorText: "Please enter quantity",
      maxQuantity: 100,
      maxLength: 3,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textInputType: TextInputType.number,
      validate: (value) => controller.validateQty(
        value,
      ),
    ),
    actions: [
      ButtonDialogInfo(
        onPressed: () {
          if (controller.validQty) {
            CustomDialog.closeDialog();
            controller.updateQty(
              cartId: product.cartId,
              qty: int.parse(controller.qtyController.text),
              isBatchUpdate: true,
            );
          }
        },
        title: "OK",
        color: kOnPrimaryBlack(context: context),
      )
    ],
  );
}
