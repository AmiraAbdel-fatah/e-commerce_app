import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;

  const CustomAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: Image.asset(
        AssetsManager.routelogo,
        height: 150.h,
        width: 100.w,
        color: AppColors.primaryColor,
      ),
      bottom: PreferredSize(
          preferredSize: Size(100, 60),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: AppColors.primaryColor,
                    style: AppStyles.medium18PrimaryDark,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 2, color: AppColors.primaryColor)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 2, color: AppColors.primaryColor)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 2, color: AppColors.primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(
                              width: 2, color: AppColors.primaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide:
                              BorderSide(width: 2, color: AppColors.redColor)),
                      prefixIcon: ImageIcon(
                        AssetImage(AssetsManager.search),
                        color: AppColors.primaryColor,
                      ),
                      hintText: "what do you search for?",
                      hintStyle: AppStyles.medium14LightPrimary,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.cartRoute),
                    icon: Badge(
                      alignment: AlignmentDirectional.topStart,
                      backgroundColor: AppColors.greenColor,
                      label: Text(ProductTabViewModel.get(context)
                          .numOfCartItems
                          .toString()),
                      child: ImageIcon(
                        AssetImage(AssetsManager.cart),
                        size: 35.sp,
                        color: AppColors.primaryColor,
                      ),
                    ))
              ],
            ),
          )),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
