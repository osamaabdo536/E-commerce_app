import 'package:flutter_ecommerce_app/data/model/response/RegisterResponse.dart';

abstract class AuthRepositoryContract{
  Future<RegisterResponse> register(String name, String email, String password, String rePassword,
      String phone);
}