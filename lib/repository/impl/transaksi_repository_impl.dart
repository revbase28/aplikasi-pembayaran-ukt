import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';

import '../../core/network/api.dart';
import '../../core/network/network_helper.dart';
import '../../core/network/network_service.dart';
import '../transaksi_repository.dart';

class TransaksiRepositoryImpl extends TransaksiRepository {
  @override
  Future<List<HistoryTransaksi>?> getHistoryTransaksi() async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.historyTransaksi,
          useBearer: true);

      return NetworkHelper.filterReponse(
          callBack: (json) => (json as List)
              .map((e) => HistoryTransaksi.fromJson(e as Map<String, dynamic>))
              .toList(),
          response: response);
    } catch (e) {
      rethrow;
    }
  }
}