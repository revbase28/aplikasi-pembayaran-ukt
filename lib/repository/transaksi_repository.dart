import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';

abstract class TransaksiRepository {
  Future<List<HistoryTransaksi>?> getHistoryTransaksi();
}