import 'package:aplikasi_pembayaran_ukt/model/check_tagihan/check_tagihan_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';

import '../model/bayar_tagihan/bayar_tagihan_response.dart';

abstract class TransaksiRepository {
  Future<CheckTagihanResponse?> checkTagihan();
  Future<List<HistoryTransaksi>?> getHistoryTransaksi();
  Future<BayarTagihanResponse?> bayarTagihan(int semester, int amount);
}