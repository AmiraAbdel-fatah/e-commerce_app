import 'package:e_commerce/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:e_commerce/featuers/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetItemsInCartUseCase getItemsInCartUseCase;

  CartViewModel({required this.getItemsInCartUseCase})
      : super(GetCartLoadingState());

  //Todo: hold data - handel logic

  bool? checkItemInCart(String productId) {
    var check = productItemsList.any((element) {
      return element.product?.id == productId;
    });
    print(check);
    return check;
  }

  double getCount(String productId) {
    double count = 0;
    var list = productItemsList.where(
      (element) {
        return element.product!.id == productId;
      },
    ).toList();

    return list.isNotEmpty ? list[0].count!.toDouble() : 0;
  }

  static CartViewModel get(BuildContext context) =>
      BlocProvider.of<CartViewModel>(context);

  GetCartResponseEntity? cart;
  List<GetProductsEntity> productItemsList = [];

  void getItemsInCart() async {
    emit(GetCartLoadingState());
    var either = await getItemsInCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartErrorState(failures: error));
    }, (response) {
      productItemsList = response.data!.products!;
      cart = response;
      print(cart!.numOfCartItems);
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

// Future<void> deleteItemFromCart(
//     String productId, BuildContext context) async {
//   var either = await deleteItemFromCartUseCase.invoke(productId);
//   either.fold((error) {
//     emit(GetCartErrorState(failures: error.errorMessage));
//   }, (response) {
//     productItemsList = response.data!.products;
//   //  cart = response;
//     ProductTabViewModel.get(context)
//         .changeNumOfCartItems(response.numOfCartItems!.toInt());
//     print(response!.numOfCartItems);
//     emit(GetCartSuccessState(responseEntity: response));
//   });
// }

// Future<void> updateItemQuantity(String productId, double count) async {
//   var either = await updateQuantityUseCase.invoke(productId, count);
//   either.fold((error) {
//     emit(GetCartErrorState(failures: error.errorMessage));
//   }, (response) {
//     productItemsList = response.data!.products;
//    // cart = response;
//     print(response!.numOfCartItems);
//     emit(GetCartSuccessState(responseEntity: response));
//   });
// }
}
