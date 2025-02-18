import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/category_brand_item.dart';
import 'cubit/home_tab_state.dart';

class HomeTab extends StatelessWidget {
  //HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        bloc: HomeTabViewModel.getInit(context)
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                _buildAnnouncement(
                    images: HomeTabViewModel.getInit(context).images),
                SizedBox(
                  height: 24.h,
                ),
                _lineBreak(name: 'Categories'),
                SizedBox(
                    height: 270.h,
                    child: state is CategorySuccessState ||
                            state is BrandSuccessState
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return CategoryBrandItem(
                                item: HomeTabViewModel.getInit(context)
                                    .categoriesList[index],
                              );
                            },
                            itemCount: HomeTabViewModel.getInit(context)
                                .categoriesList
                                .length,
                            scrollDirection: Axis.horizontal,
                          )
                        : Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))),
                //child: _buildCategoryBrandSection(CategoryBrandItem())),
                _lineBreak(name: 'Brands'),
                SizedBox(
                    height: 300.h,
                    child: state is CategorySuccessState ||
                            state is BrandSuccessState
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return CategoryBrandItem(
                                item: HomeTabViewModel.getInit(context)
                                    .brandsList[index],
                              );
                            },
                            itemCount: HomeTabViewModel.getInit(context)
                                .brandsList
                                .length,
                            scrollDirection: Axis.horizontal,
                          )
                        : Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))),
              ],
            ),
          );
        });

    //   SingleChildScrollView(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         height: 16.h,
    //       ),
    //       _buildAnnouncement(images: viewModel.images),
    //       SizedBox(
    //         height: 24.h,
    //       ),
    //       _lineBreak(name: 'Categories'),
    //       BlocBuilder<HomeTabViewModel, HomeTabStates>(
    //         bloc: viewModel..getAllCategories(),
    //         builder: (context, state) {
    //           if (state is CategoryLoadingState) {
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 color: AppColors.primaryColor,
    //               ),
    //             );
    //           } else if (state is CategoryErrorState) {
    //             return Text(state.failures.errorMessage);
    //           } else if (state is CategorySuccessState) {
    //             return _buildCategoryBrandSection(
    //                 list: state.responseEntity.data!);
    //
    //             //Text(state.responseEntity.data!.length.toString());
    //           }
    //           return Container();
    //         },
    //       ),
    //       //child: _buildCategoryBrandSection(CategoryBrandItem())),
    //       _lineBreak(name: 'Brands'),
    //       BlocBuilder<HomeTabViewModel, HomeTabStates>(
    //         bloc: viewModel..getAllBrands(),
    //         builder: (context, state) {
    //           if (state is BrandLoadingState) {
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 color: AppColors.primaryColor,
    //               ),
    //             );
    //           } else if (state is BrandErrorState) {
    //             return Text(state.failures.errorMessage);
    //           } else if (state is BrandSuccessState) {
    //             return _buildCategoryBrandSection(
    //                 list: state.responseEntity.data!);
    //
    //             //Text(state.responseEntity.data!.length.toString());
    //           }
    //           return Container();
    //         },
    //       )
    //     ],
    //   ),
    // );

    // BlocBuilder<HomeTabViewModel, HomeTabStates>(
    //   bloc: viewModel..getAllCategories(),
    //   builder: (context,state){
    //     return SingleChildScrollView(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(height: 16.h,),
    //           _buildAnnouncement(
    //             images: [
    //               AssetsManager.ad1,
    //               AssetsManager.ad2,
    //               AssetsManager.ad3,
    //             ],
    //           ),
    //           SizedBox(height: 24.h,),
    //           _lineBreak(name: 'Categories'),
    //           //state is CategoryLoadingState ?
    //           viewModel.categoriesList.isEmpty?
    //           Center(child: CircularProgressIndicator(
    //             color: AppColors.primaryColor,
    //           ),)
    //           :
    //           Text(viewModel.categoriesList.length.toString()),
    //          // _buildCategoryBrandSection(CategoryBrandItem()),
    //           _lineBreak(name: 'Brands'),
    //           _buildCategoryBrandSection(CategoryBrandItem())
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  SizedBox _buildCategoryBrandSection(
      {required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
        ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        // Use a specific scroll physics class
        itemBuilder: (context, index) {
          return CategoryBrandItem(item: list[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(), // Convert the Iterable to List<Widget>
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppStyles.medium18Black,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: AppStyles.medium14PrimaryDark,
            )),
      ],
    );
  }
}
