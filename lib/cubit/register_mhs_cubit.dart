import 'package:aplikasi_pembayaran_ukt/model/register_mahasiswa/register_mhs_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/auth_service.dart';

part 'register_mhs_state.dart';

class RegisterMhsCubit extends Cubit<RegisterMhsState> {
  RegisterMhsCubit() : super(RegisterMhsInitial());

  void registerMhs(String nim, String password) async {
    try{
      emit(RegisterMhsLoading());

      RegisterMhsResponse? registerMhsResponse = await AuthService().registerMhs(nim, password);

      if(registerMhsResponse == null){
        emit(const RegisterMhsFailed("Register data is null"));
      } else {
        emit(RegisterMhsSuccess(registerMhsResponse));
      }

    } catch(e){
      emit(RegisterMhsFailed(e.toString()));
    }
  }
}
