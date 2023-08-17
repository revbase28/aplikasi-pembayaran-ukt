import 'package:aplikasi_pembayaran_ukt/core/tools/shared_pref_util.dart';

import '../model/check_mhs_status/check_mhs_acc_status_response.dart';
import '../model/login/login_response.dart';
import '../model/register_mahasiswa/register_mhs_response.dart';
import '../repository/auth_repository.dart';
import '../repository/impl/auth_repository_impl.dart';

class AuthService{
  final AuthRepository _authRepo = AuthRepositoryImpl();

  Future<LoginResponse?> login({required String username, required String password}) async {
    try{
      LoginResponse? loginResponse = await _authRepo.login(username, password);
      if(loginResponse != null){
        SharedPrefUtil.storeRole(loginResponse.role!);
        SharedPrefUtil.storeName(loginResponse.data?.name ?? "");
        SharedPrefUtil.storeToken(loginResponse.token!);
        SharedPrefUtil.storeNim(loginResponse.data?.nim ?? "");
        SharedPrefUtil.storeSemester(loginResponse.data?.semester ?? "");
      }

      return loginResponse;
    } catch(e){
      rethrow;
    }
  }

  Future<RegisterMhsResponse?> registerMhs(String nim, String password) async {
    try{
      RegisterMhsResponse? registerResponse = await _authRepo.register(nim, password);
      return registerResponse;
    } catch(e){
      rethrow;
    }
  }

  Future<CheckMhsAccStatusResponse?> checkMhsAccStatus(String nim) async {
    try{
      CheckMhsAccStatusResponse? statusResponse = await _authRepo.checkMhsAccStatusAccount(nim);
      return statusResponse;
    } catch(e){
      rethrow;
    }
  }
}