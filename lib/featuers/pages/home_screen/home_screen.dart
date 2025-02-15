import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/featuers/pages/home_screen/cubit/home_state.dart';
import 'package:e_commerce/featuers/pages/home_screen/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            title: Image.asset(AssetsManager.routelogo),
            automaticallyImplyLeading: false,
          ),
          // appBar: _buildAppBar(viewModel.selectedIndex),
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
