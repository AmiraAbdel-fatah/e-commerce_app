import 'package:cached_network_image/cached_network_image.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../domain/entities/GetCartResponseEntity.dart';
import 'constant_manager.dart';

class CartItem extends StatelessWidget {
  CartItem({required this.product});

  GetProductsEntity product;

  @override
  Widget build(BuildContext context) {
    print('##########${product.product!.id}');
    return Container(
      margin: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(15.h),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.h),
            child: CachedNetworkImage(
              imageUrl: product.product!.imageCover ?? "",
              width: 150.w,
              height: 150.h,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Column(children: [
            SizedBox(
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.product!.title ?? '',
                      style: AppStyles.medium18Black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // CartViewModel.get(context).deleteItemFromCart(
                        //     product.product!.id ?? '', context);
                      },
                      icon: ImageIcon(AssetImage(AssetsManager.delete)))
                ],
              ),
            ),
            SizedBox(
              width: 250.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EGP ${product.price}',
                    style: AppStyles.medium18Black,
                  ),
                  CustomizableCounter(
                    borderRadius: 50,
                    borderWidth: 0,
                    buttonText: ConstantManager.chooseAmount,
                    backgroundColor: AppColors.primaryColor,
                    textColor: Colors.white,
                    textSize: 16.sp,
                    count: product.count!.toDouble(),
                    step: 1,
                    minCount: 0,
                    maxCount: product.product!.quantity != null
                        ? product.product!.quantity!.toDouble()
                        : 300,
                    incrementIcon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    decrementIcon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white,
                    ),
                    onCountChange: (count) {},
                    onIncrement: (count) {
                      // CartViewModel.get(context)
                      //     .updateItemQuantity(product.product!.id ?? '', count);
                    },
                    onDecrement: (count) {
                      // CartViewModel.get(context)
                      //     .updateItemQuantity(product.product!.id ?? '', count);
                    },
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
