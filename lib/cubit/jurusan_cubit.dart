import 'package:aplikasi_pembayaran_ukt/service/jurusan_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/get_jurusan/jurusan.dart';

part 'jurusan_state.dart';

class JurusanCubit extends Cubit<JurusanState> {
  JurusanCubit() : super(JurusanInitial());

  void getJurusanList() async {
    try{
      emit(JurusanLoading());

      List<Jurusan>? jurusanList = await JurusanService().getAllJurusan();

      if(jurusanList == null){
        emit(const JurusanFailed("Jurusan list data is null"));
      } else {
        emit(JurusanSuccess(jurusanList));
      }

    } catch(e){
      emit(JurusanFailed(e.toString()));
    }
  }
}
