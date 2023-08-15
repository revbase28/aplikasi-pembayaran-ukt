import 'package:aplikasi_pembayaran_ukt/model/get_jurusan/jurusan.dart';

import '../../core/network/api.dart';
import '../../core/network/network_helper.dart';
import '../../core/network/network_service.dart';
import '../jurusan_repository.dart';

class JurusanRepositoryImpl extends JurusanRepository {
  @override
  Future<List<Jurusan>?> getJurusan() async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.jurusan,
          useBearer: true);

      return NetworkHelper.filterReponse(
          callBack: (json) => (json as List)
              .map((e) => Jurusan.fromJson(e as Map<String, dynamic>))
              .toList(),
          response: response);
    } catch (e) {
      rethrow;
    }
  }
}
