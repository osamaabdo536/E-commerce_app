import 'package:flutter_ecommerce_app/data/model/response/RegisterResponse.dart';

abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{
  String? loadingMessage;
  RegisterLoadingState({this.loadingMessage});
}

class RegisterErrorState extends RegisterStates{
  String? errorMessage;
  RegisterErrorState({this.errorMessage});
}

class RegisterSuccessState extends RegisterStates{
  RegisterResponse response ;
  RegisterSuccessState({required this.response});
}