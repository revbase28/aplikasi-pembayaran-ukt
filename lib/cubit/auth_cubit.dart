import 'package:aplikasi_pembayaran_ukt/model/login/login_response.dart';
import 'package:aplikasi_pembayaran_ukt/service/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../core/tools/shared_pref_util.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String username, String password) async {
    try{
      emit(AuthLoading());

      LoginResponse? loginResponse = await AuthService().login(username: username, password: password);

      if(loginResponse == null){
        emit(const AuthFailed("Login data is null"));
      } else {
        emit(AuthSuccess(loginResponse));
      }

    } catch(e){
      emit(AuthFailed(e.toString()));
    }
  }

  void logout(){
    SharedPrefUtil.storeToken("");
    SharedPrefUtil.storeName("");
    SharedPrefUtil.storeRole("");
    SharedPrefUtil.storeNim("");
  }
}
