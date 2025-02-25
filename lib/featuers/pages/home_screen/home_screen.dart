import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/featuers/pages/home_screen/cubit/home_state.dart';
import 'package:e_commerce/featuers/pages/home_screen/cubit/home_view_model.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_state.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
                data: Theme.of(context)
                    .copyWith(canvasColor: AppColors.primaryColor),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    currentIndex: viewModel.selectedIndex,
                    onTap: viewModel.bottomNavigationOnTab,
                    iconSize: 24.sp,
                    // Adjust the icon size
                    items: [
                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedIndex == 0,
                          selectedIcon: AssetsManager.home,
                          unSelectedIcon: AssetsManager.home),
                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedIndex == 1,
                          selectedIcon: AssetsManager.shop,
                          unSelectedIcon: AssetsManager.shop),
                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedIndex == 2,
                          selectedIcon: AssetsManager.favourite,
                          unSelectedIcon: AssetsManager.favourite),
                      _bottomNavBarItemBuilder(
                          isSelected: viewModel.selectedIndex == 3,
                          selectedIcon: AssetsManager.personal,
                          unSelectedIcon: AssetsManager.personal),
                    ])),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
      required String selectedIcon,
      required String unSelectedIcon}) {
    return BottomNavigationBarItem(
        icon: CircleAvatar(
          foregroundColor:
              isSelected ? AppColors.primaryColor : AppColors.whiteColor,
          backgroundColor:
              isSelected ? AppColors.whiteColor : AppColors.transparentColor,
          radius: 25.r,
          child: Image.asset(isSelected ? selectedIcon : unSelectedIcon),
        ),
        label: '');
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(50.r));
  }
}

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
                    icon: BlocBuilder<ProductTabViewModel, ProductTabState>(
                      builder: (context, state) {
                        return Badge(
                          alignment: AlignmentDirectional.topStart,
                          backgroundColor: AppColors.greenColor,
                          label: state is AddCartSuccessState
                              ? Text(ProductTabViewModel.get(context)
                                  .numOfCartItems
                                  .toString())
                              : Text(ProductTabViewModel.get(context)
                                  .numOfCartItems
                                  .toString()),
                          child: ImageIcon(
                            AssetImage(AssetsManager.cart),
                            size: 35.sp,
                            color: AppColors.primaryColor,
                          ),
                        );
                      },
                      // child:
                      // Badge(
                      //   alignment: AlignmentDirectional.topStart,
                      //   backgroundColor: AppColors.greenColor,
                      //   label: Text(ProductTabViewModel.get(context)
                      //       .numOfCartItems
                      //       .toString()),
                      //   child: ImageIcon(
                      //     AssetImage(AssetsManager.cart),
                      //     size: 35.sp,
                      //     color: AppColors.primaryColor,
                      //   ),
                      // ),
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
