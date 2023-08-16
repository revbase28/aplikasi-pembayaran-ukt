import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/mahasiswa_dashboard/mahasiswa_dashboard_data.dart';
import '../service/dashboard_service.dart';

part 'mahasiswa_dashboard_state.dart';

class MahasiswaDashboardCubit extends Cubit<MahasiswaDashboardState> {
  MahasiswaDashboardCubit() : super(MahasiswaDashboardInitial());

  void getMahasiswaDahboardData() async {
    try{
      emit(MahasiswaDashboardLoading());

      MahasiswaDashboardData? data = await DashboardService().getMahasiswaDashboardData();

      if(data == null){
        emit(const MahasiswaDashboardFailed("Mahasiswa dashboard data is null"));
      } else {
        emit(MahasiswaDashboardSuccess(data));
      }

    } catch(e){
      emit(MahasiswaDashboardFailed(e.toString()));
    }
  }
}