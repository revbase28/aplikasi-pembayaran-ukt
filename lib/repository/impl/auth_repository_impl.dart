import 'package:aplikasi_pembayaran_ukt/model/login/login_response.dart';
import 'package:aplikasi_pembayaran_ukt/repository/auth_repository.dart';

import '../../core/network/api.dart';
import '../../core/network/network_helper.dart';
import '../../core/network/network_service.dart';

class AuthRepositoryImpl extends AuthRepository{
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
}