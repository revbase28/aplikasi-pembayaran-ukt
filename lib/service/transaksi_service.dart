import 'package:aplikasi_pembayaran_ukt/model/bayar_tagihan/bayar_tagihan_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/check_tagihan/check_tagihan_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';
import 'package:aplikasi_pembayaran_ukt/repository/impl/transaksi_repository_impl.dart';
import '../repository/transaksi_repository.dart';

class TransaksiService {
  final TransaksiRepository _transaksiRepository = TransaksiRepositoryImpl();

  Future<List<HistoryTransaksi>?> getHistoryTransaksi() async {
    try{
      return await _transaksiRepository.getHistoryTransaksi();
    } catch(e){
      rethrow;
    }
  }

  Future<CheckTagihanResponse?> checkTagihan() async {
    try{
      return await _transaksiRepository.checkTagihan();
    } catch(e){
      rethrow;
    }
  }

  Future<BayarTagihanResponse?> bayarTagihan(int semester, int amount) async {
    try{
      return await _transaksiRepository.bayarTagihan(semester, amount);
    } catch(e){
      rethrow;
    }
  }
}