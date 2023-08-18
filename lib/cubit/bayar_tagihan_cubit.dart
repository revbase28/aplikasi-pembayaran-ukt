import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/bayar_tagihan/bayar_tagihan_response.dart';
import '../service/transaksi_service.dart';

part 'bayar_tagihan_state.dart';

class BayarTagihanCubit extends Cubit<BayarTagihanState> {
  BayarTagihanCubit() : super(BayarTagihanInitial());

  void bayarTagihan(int semester, int amount) async{
    try{
      emit(BayarTagihanLoading());

      BayarTagihanResponse? response = await TransaksiService().bayarTagihan(semester, amount);

      if(response == null){
        emit(const BayarTagihanFailed("Bayar Tagihan data is null"));
      } else {
        emit(BayarTagihanSuccess(response));
      }

    } catch(e){
      emit(BayarTagihanFailed(e.toString()));
    }
  }
}