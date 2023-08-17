import 'package:aplikasi_pembayaran_ukt/model/check_mhs_status/check_mhs_acc_status_response.dart';
import 'package:aplikasi_pembayaran_ukt/service/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_mhs_acc_state.dart';

class CheckMhsAccCubit extends Cubit<CheckMhsAccState> {
  CheckMhsAccCubit() : super(CheckMhsAccInitial());
  
  void checkMhsAccStatus(String nim) async {
    try{
      emit(CheckMhsAccLoading());

      CheckMhsAccStatusResponse? response = await AuthService().checkMhsAccStatus(nim);

      if(response == null){
        emit(const CheckMhsAccFailed("CheckMhsAcc data is null"));
      } else {
        emit(CheckMhsAccSuccess(response));
      }

    } catch(e){
      emit(CheckMhsAccFailed(e.toString()));
    }
  }

  void setStateToIntial(){
    emit(CheckMhsAccInitial());
  }
}
