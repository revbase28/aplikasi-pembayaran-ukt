import 'package:aplikasi_pembayaran_ukt/model/check_mhs_status/check_mhs_acc_status_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/login/login_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/register_mahasiswa/register_mhs_response.dart';
import 'package:aplikasi_pembayaran_ukt/repository/auth_repository.dart';

import '../../core/network/api.dart';
import '../../core/network/network_helper.dart';
import '../../core/network/network_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<LoginResponse?> login(String username, String password) async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.post,
          baseUrl: API.baseAPI(),
          endpoint: API.login,
          body: {
            "username": username,
            "password": password,
          });

      return NetworkHelper.filterReponse(
          callBack: (json) => LoginResponse.fromJson(json), response: response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CheckMhsAccStatusResponse?> checkMhsAccStatusAccount(String nim) async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.checkMhsAccStatus,
          useBearer: true,
          queryParam: {"nim": nim }
      );

      return NetworkHelper.filterReponse(
          callBack: (json) => CheckMhsAccStatusResponse.fromJson(json), response: response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RegisterMhsResponse?> register(String nim, String password) async {

    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.post,
          baseUrl: API.baseAPI(),
          endpoint: API.registerMhs,
          useBearer: true,
          body: {
            "nim": nim,
            "password": password,
          });

      return NetworkHelper.filterReponse(
          callBack: (json) => RegisterMhsResponse.fromJson(json), response: response);
    } catch (e) {
      rethrow;
    }
  }
}
