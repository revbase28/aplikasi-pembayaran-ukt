import 'package:aplikasi_pembayaran_ukt/core/tools/shared_pref_util.dart';
import 'package:aplikasi_pembayaran_ukt/model/get_detail_ukt_semester/detail_ukt_semester_response.dart';
import 'package:aplikasi_pembayaran_ukt/model/mahasiswa_dashboard/mahasiswa_dashboard_data.dart';
import 'package:aplikasi_pembayaran_ukt/model/petugas_dashboard/petugas_dashboard_data.dart';
import 'package:aplikasi_pembayaran_ukt/repository/dahboard_repository.dart';
import 'package:aplikasi_pembayaran_ukt/repository/impl/dahboard_repository_impl.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/mahasiswa_dashboard_page.dart';

import '../model/login/login_response.dart';
import '../repository/auth_repository.dart';
import '../repository/impl/auth_repository_impl.dart';

class DashboardService{
  DashboardRepository _dahboardRepo = DashboardRepositoryImpl();

  Future<PetugasDashboardData?> getPetugasDashboardData() async {
    try{
      PetugasDashboardData? petugasDashboardData = await _dahboardRepo.getPetugasDashboardData();
      return petugasDashboardData;
    } catch(e){
      rethrow;
    }
  }

  Future<MahasiswaDashboardData?> getMahasiswaDashboardData() async {
    try{
      MahasiswaDashboardData? mhsDashboardData = await _dahboardRepo.getMahasiswaDashboardData();
      return mhsDashboardData;
    } catch(e){
      rethrow;
    }
  }

  Future<DetailUktSemesterResponse?> getDetailUktSemester(String semester, String jurusanId) async {
    try{
      DetailUktSemesterResponse? detailUktSemester = await _dahboardRepo.getDetailUktSemester(semester, jurusanId);
      return detailUktSemester;
    } catch(e){
      rethrow;
    }
  }
}