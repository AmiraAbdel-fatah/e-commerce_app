import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/featuers/auth/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  // todo: hold data - handel Logic

  //TextEditingController userNameController = TextEditingController(text: 'Amira');
  TextEditingController passwordController =
      TextEditingController(text: 'Amira123456');
  TextEditingController emailController =
      TextEditingController(text: 'amira235@gmail.com');
  TextEditingController fullNameController =
      TextEditingController(text: 'amira');
  TextEditingController phoneController =
      TextEditingController(text: '01234568977');
  TextEditingController rePasswordController =
      TextEditingController(text: 'Amira123456');
  var formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(failures: error));
      }, (response) {
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
  }
}
