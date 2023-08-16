import 'package:aplikasi_pembayaran_ukt/model/petugas_dashboard/petugas_dashboard_data.dart';
import 'package:aplikasi_pembayaran_ukt/service/dashboard_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'petugas_dashboard_state.dart';

class PetugasDashboardCubit extends Cubit<PetugasDashboardState> {
  PetugasDashboardCubit() : super(PetugasDashboardInitial());

  void getPetugasDahboardData() async {
    try{
      emit(PetugasDashboardLoading());

      PetugasDashboardData? data = await DashboardService().getPetugasDashboardData();

      if(data == null){
        emit(const PetugasDashboardFailed("Petugas dashboard data is null"));
      } else {
        emit(PetugasDashboardSuccess(data));
      }

    } catch(e){
      emit(PetugasDashboardFailed(e.toString()));
    }
  }
}
