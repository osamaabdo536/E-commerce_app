import 'package:flutter_ecommerce_app/data/model/response/RegisterResponse.dart';
import 'package:flutter_ecommerce_app/data/repository/auth_repository/data_source/auth_remote_data_source_imlp.dart';
import '../../../../domain/repository/data_source/auth_remote_data_source.dart';
import '../../../../domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<RegisterResponse> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

}

AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}