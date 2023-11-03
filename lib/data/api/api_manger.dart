import 'dart:convert';

import 'package:flutter_ecommerce_app/data/api/api_constants.dart';
import 'package:flutter_ecommerce_app/data/model/request/RegisterRequest.dart';
import 'package:flutter_ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  ApiManger._();
  static ApiManger? _instance;
  static ApiManger getInstance(){
    _instance ??= ApiManger._();
    return _instance!;
  }
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
   */
  
   Future<RegisterResponse> register(String name, String email, String password, String rePassword,
      String phone) async {
     Uri url = Uri.http(ApiConstants.baseUrl,ApiConstants.registerApi);
     var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
    var response = await http.post(url,body: requestBody.toJson());
    var responseBody = response.body ;
    var json = jsonDecode(responseBody);
    return RegisterResponse.fromJson(json);
  }
}
