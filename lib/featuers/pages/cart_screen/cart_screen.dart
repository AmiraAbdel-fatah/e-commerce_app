import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/constant_manager.dart';
import 'cubit/cart_states.dart';
import 'cubit/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
        bloc: CartViewModel.get(context)..getItemsInCart(),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              title: Text(ConstantManager.cart, style: AppStyles.medium18Black),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ImageIcon(
                    AssetImage(AssetsManager.search),
                    color: AppColors.primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ImageIcon(
                    AssetImage(AssetsManager.cart),
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            body: CartViewModel.get(context).productItemsList != null
                ? ListView.builder(
                    itemCount:
                        CartViewModel.get(context).productItemsList.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        product:
                            CartViewModel.get(context).productItemsList[index],
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )),
            bottomNavigationBar: CartViewModel.get(context).cart != null
                ? BottomAppBar(
                    color: AppColors.whiteColor,
                    height: 102.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              ConstantManager.totalItemPrice,
                              style: AppStyles.regular18Primary,
                            ),
                            Text(
                              'EGP ${CartViewModel.get(context).cart!.data!.totalCartPrice}',
                              style: AppStyles.regular18Primary,
                            )
                          ],
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                foregroundColor: AppColors.whiteColor),
                            label: Text(ConstantManager.checkOut),
                            onPressed: () {},
                            icon:
                                ImageIcon(AssetImage(AssetsManager.addToCart)))
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )),
          );
        });
  }
}
