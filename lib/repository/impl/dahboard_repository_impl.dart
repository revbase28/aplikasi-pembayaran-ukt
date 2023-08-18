import 'package:aplikasi_pembayaran_ukt/model/get_detail_ukt_semester/detail_ukt_semester_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/mahasiswa_dashboard/mahasiswa_dashboard_data.dart';
import 'package:aplikasi_pembayaran_ukt/model/petugas_dashboard/petugas_dashboard_data.dart';
import 'package:aplikasi_pembayaran_ukt/repository/dahboard_repository.dart';

import '../../core/network/api.dart';
import '../../core/network/network_helper.dart';
import '../../core/network/network_service.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  @override
  Future<PetugasDashboardData?> getPetugasDashboardData() async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.petugasDashboard,
          useBearer: true);

      return NetworkHelper.filterReponse(
          callBack: (json) => PetugasDashboardData.fromJson(json),
          response: response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MahasiswaDashboardData?> getMahasiswaDashboardData() async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.mahasiswaDashboard,
          useBearer: true);

      return NetworkHelper.filterReponse(
          callBack: (json) => MahasiswaDashboardData.fromJson(json),
          response: response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetailUktSemesterResponse?> getDetailUktSemester(
      String semester, String jurusanId) async {
    try {
      final response = await NetworkService.sendRequest(
          requestType: RequestType.get,
          baseUrl: API.baseAPI(),
          endpoint: API.detailUktSemester,
          useBearer: true,
          queryParam: {"semester": semester, "id_jurusan": jurusanId});

      return NetworkHelper.filterReponse(
          callBack: (json) => DetailUktSemesterResponse.fromJson(json),
          response: response);
    } catch (e) {
      rethrow;
    }
  }
}
