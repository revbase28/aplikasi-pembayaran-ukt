import 'package:aplikasi_pembayaran_ukt/service/transaksi_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/history_transaksi/history_transaksi.dart';

part 'history_transaksi_state.dart';

class HistoryTransaksiCubit extends Cubit<HistoryTransaksiState> {
  HistoryTransaksiCubit() : super(HistoryTransaksiInitial());

  void getHistoryTransaksi() async {
    try{
      emit(HistoryTransaksiLoading());

      List<HistoryTransaksi>? historyTransaksiList = await TransaksiService().getHistoryTransaksi();

      if(historyTransaksiList == null){
        emit(const HistoryTransaksiFailed("History transaksi list data is null"));
      } else {
        emit(HistoryTransaksiSuccess(historyTransaksiList));
      }

    } catch(e){
      emit(HistoryTransaksiFailed(e.toString()));
    }
  }
}
