import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';

abstract class ProductTabState {}

class ProductTabInitialState extends ProductTabState {}

class ProductTabLoadingState extends ProductTabState {}

class ProductTabErrorState extends ProductTabState {
  Failures failures;

  ProductTabErrorState({required this.failures});
}

class ProductTabSuccessState extends ProductTabState {
  ProductsResponseEntity responseEntity;

  ProductTabSuccessState({required this.responseEntity});
}
