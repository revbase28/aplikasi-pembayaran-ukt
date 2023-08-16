import '../model/mahasiswa_dashboard/mahasiswa_dashboard_data.dart';
import '../model/petugas_dashboard/petugas_dashboard_data.dart';

abstract class DashboardRepository{
  Future<PetugasDashboardData?> getPetugasDashboardData();
  Future<MahasiswaDashboardData?> getMahasiswaDashboardData();
}