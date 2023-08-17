import '../model/check_mhs_status/check_mhs_acc_status_response.dart';
import '../model/login/login_response.dart';
import '../model/register_mahasiswa/register_mhs_response.dart';

abstract class AuthRepository{
  Future<LoginResponse?> login(String username, String password);
  Future<CheckMhsAccStatusResponse?> checkMhsAccStatusAccount(String nim);
  Future<RegisterMhsResponse?> register(String nim, String password);
}