import 'package:flutter_ecommerce_app/data/api/api_manger.dart';
import 'package:flutter_ecommerce_app/data/model/response/RegisterResponse.dart';
import '../../../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<RegisterResponse> register(String name, String email, String password,
      String rePassword, String phone) async {
    var response =
        await apiManger.register(name, email, password, rePassword, phone);
    return response;
  }
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
 return AuthRemoteDataSourceImpl(apiManger: ApiManger.getInstance());
}