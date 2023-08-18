import '../model/get_detail_ukt_semester/detail_ukt_semester_response.dart';
import '../model/mahasiswa_dashboard/mahasiswa_dashboard_data.dart';
import '../model/petugas_dashboard/petugas_dashboard_data.dart';

abstract class DashboardRepository{
  Future<PetugasDashboardData?> getPetugasDashboardData();
  Future<MahasiswaDashboardData?> getMahasiswaDashboardData();
  Future<DetailUktSemesterResponse?> getDetailUktSemester(String semester, String jurusanId);
}