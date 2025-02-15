import 'package:e_commerce/domain/entities/CategoryOrBrandsResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/home_tab/cubit/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../domain/use_cases/get_all_brands_use_case.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GatAllCategoriesUseCase gatAllCategoriesUseCase;
  GatAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.gatAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  //Todo: hold data - handel logic

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> images = [
    AssetsManager.ad1,
    AssetsManager.ad2,
    AssetsManager.ad3,
  ];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await gatAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      categoriesList = response.data!.toList();
      emit(CategorySuccessState(responseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(BrandErrorState(failures: error));
    }, (response) {
      brandsList = response.data!.toList();
      emit(BrandSuccessState(responseEntity: response));
    });
  }
}
