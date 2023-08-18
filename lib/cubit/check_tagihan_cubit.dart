import 'package:aplikasi_pembayaran_ukt/model/check_tagihan/check_tagihan_response.dart';
import 'package:aplikasi_pembayaran_ukt/service/transaksi_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_tagihan_state.dart';

class CheckTagihanCubit extends Cubit<CheckTagihanState> {
  CheckTagihanCubit() : super(CheckTagihanInitial());
  
  void checkTagihan() async{
    try{
      emit(CheckTagihanLoading());

      CheckTagihanResponse? response = await TransaksiService().checkTagihan();

      if(response == null){
        emit(const CheckTagihanFailed("Check Tagihan data is null"));
      } else {
        emit(CheckTagihanSuccess(response));
      }

    } catch(e){
      emit(CheckTagihanFailed(e.toString()));
    }
  }
}
