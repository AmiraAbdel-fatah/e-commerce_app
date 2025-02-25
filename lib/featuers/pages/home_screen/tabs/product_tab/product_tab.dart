import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_state.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:e_commerce/featuers/widgets/product_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  //ProductTabViewModel viewModel = getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductTabState>(
      bloc: ProductTabViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        if (state is ProductTabErrorState) {
          return Center(
            child: Text(state.failures.errorMessage),
          );
        } else if (state is ProductTabSuccessState) {
          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.responseEntity.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Todo: Navigate to product details
                          Navigator.pushNamed(context, AppRoutes.productRoute,
                              arguments: ProductTabViewModel.get(context)
                                  .productsList[index]);
                        },
                        child: ProductTabItem(
                            product: state.responseEntity.data![index]
                            // product: ProductTabViewModel.get(context).productsList[index],
                            ),
                        // or

                        //child: ProductTabItem(product: viewModel.productsList[index],),
                      );
                    }),
              )
            ],
          ));
        } else if (state is ProductTabLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryDarkLight,
          ));
        }
        return Container();
      },

      // child:
      // SafeArea(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //           child: GridView.builder(
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                 childAspectRatio: 2/3.2.h,
      //                 crossAxisSpacing: 16.w,
      //                 mainAxisSpacing: 16.h,
      //               ),
      //               itemCount: 10,
      //               itemBuilder: (context,index){
      //                 return InkWell(
      //                   onTap: (){
      //                     // Todo: Navigate to product details
      //
      //                   },
      //                   child: ProductTabItem(),
      //                 );
      //               }),
      //       )
      //     ],
      //   )),
    );
  }
}
