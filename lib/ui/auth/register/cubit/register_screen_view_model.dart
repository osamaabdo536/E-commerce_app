import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/domain/use_case/register_use_case.dart';
import 'package:flutter_ecommerce_app/ui/auth/register/cubit/register_states.dart';
import '../../../../domain/repository/repository/auth_repository_contract.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterLoadingState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'osama');
  var emailController = TextEditingController(text: 'osama@route.com');
  var passwordController = TextEditingController(text: '123456');
  var confirmationController = TextEditingController(text: '123456');
  var phoneController = TextEditingController();
  bool isObscure = true;
  RegisterUseCase registerUseCase;
  Future<void> register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState(loadingMessage: 'Loading...'));
        var response = await registerUseCase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            confirmationController.text,
            phoneController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
