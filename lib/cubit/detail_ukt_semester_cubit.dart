import 'package:aplikasi_pembayaran_ukt/service/dashboard_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/get_detail_ukt_semester/detail_ukt_semester_response.dart';

part 'detail_ukt_semester_state.dart';

class DetailUktSemesterCubit extends Cubit<DetailUktSemesterState> {
  DetailUktSemesterCubit() : super(DetailUktSemesterInitial());

  void getDetailUktSemester(String semester, String jurusanId) async{
    try{
      emit(DetailUktSemesterLoading());

      DetailUktSemesterResponse? response = await DashboardService().getDetailUktSemester(semester, jurusanId);

      if(response == null){
        emit(const DetailUktSemesterFailed("Detail Ukt Semester data is null"));
      } else {
        emit(DetailUktSemesterSuccess(response));
      }

    } catch(e){
      emit(DetailUktSemesterFailed(e.toString()));
    }
  }

  void setToInitialState(){
    emit(DetailUktSemesterInitial());
  }
}
