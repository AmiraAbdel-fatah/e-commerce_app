import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';
import 'package:e_commerce/featuers/pages/home_screen/tabs/product_tab/cubit/product_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../domain/use_cases/get_all_products_use_case.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabState> {
  GatAllProductsUseCase getAllProductsUseCase;

  ProductTabViewModel({required this.getAllProductsUseCase})
      : super(ProductTabInitialState());

  // Todo: hold data - handel logic

  List<ProductEntity> productsList = [];

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
}
