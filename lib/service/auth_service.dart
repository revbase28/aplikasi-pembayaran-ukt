import 'package:aplikasi_pembayaran_ukt/core/tools/shared_pref_util.dart';

import '../model/login/login_response.dart';
import '../repository/auth_repository.dart';
import '../repository/impl/auth_repository_impl.dart';

class AuthService{
  AuthRepository authRepo = AuthRepositoryImpl();

  Future<LoginResponse?> login({required String username, required String password}) async {
    try{
      LoginResponse? loginResponse = await authRepo.login(username, password);
      if(loginResponse != null){
        SharedPrefUtil.storeRole(loginResponse.role!);
        SharedPrefUtil.storeName(loginResponse.data?.name ?? "");
        SharedPrefUtil.storeToken(loginResponse.token!);
        SharedPrefUtil.storeNim(loginResponse.data?.nim ?? "");
      }

      return loginResponse;
    } catch(e){
      rethrow;
    }
  }
}