import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/add_cart_use_case.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entities/AddToCartResponseEntity.dart';
import '../../../../../../domain/use_cases/get_all_products_use_case.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabState> {
  GatAllProductsUseCase getAllProductsUseCase;
  AddCartUseCase addCartUseCase;

  ProductTabViewModel(
      {required this.getAllProductsUseCase, required this.addCartUseCase})
      : super(ProductTabInitialState());

  // Todo: hold data - handel logic

  AddToCartResponseEntity? addToCartResponse;
  List<ProductEntity> productsList = [];

  int numOfCartItems = 0;

  void changeNumOfCartItems(int newNumber) {
    numOfCartItems = newNumber;
  }

  int totalPrice = 0;

  void updateTotalPrice(int price) {
    totalPrice = price;
    emit(ProductTabChangeTotalPriceState());
  }

  double count = 0;

  void changeCount(double newCount) {
    count = newCount;
  }

  static ProductTabViewModel get(BuildContext context) =>
      BlocProvider.of<ProductTabViewModel>(context);

  Future<void> getAllProducts() async {
    emit(ProductTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductTabErrorState(failures: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductTabSuccessState(responseEntity: response));
    });
  }

  Future<void> addToCart(String productId) async {
    emit(AddCartLoadingState());
    var either = await addCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddCartErrorState(failures: error));
    }, (response) {
      addToCartResponse = response;
      numOfCartItems = response.numOfCartItems!.toInt();
      print('numOfCartItems :$numOfCartItems');
      emit(AddCartSuccessState(responseEntity: response));
    });
  }
}
