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
}