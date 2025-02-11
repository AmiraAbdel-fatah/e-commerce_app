import 'package:e_commerce/featuers/auth/login/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/login_use_case.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  // todo: hold data - handel Logic

  TextEditingController passwordController =
      TextEditingController(text: 'amira123');
  TextEditingController emailController =
      TextEditingController(text: 'amira235@gmail.com');

  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(failures: error));
      }, (response) {
        emit(LoginSuccessState(responseEntity: response));
      });
    }
  }
}
