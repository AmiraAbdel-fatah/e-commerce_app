import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/domain/entities/GetCartResponseEntity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}
