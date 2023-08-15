import 'package:aplikasi_pembayaran_ukt/repository/impl/jurusan_repository_impl.dart';
import 'package:aplikasi_pembayaran_ukt/repository/jurusan_repository.dart';

import '../model/get_jurusan/jurusan.dart';

class JurusanService {
  JurusanRepository _jurusanRepository = JurusanRepositoryImpl();

  Future<List<Jurusan>?> getAllJurusan() async {
    try{
      return await _jurusanRepository.getJurusan();
    } catch(e){
      rethrow;
    }
  }
}