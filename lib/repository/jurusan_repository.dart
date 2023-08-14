import 'package:aplikasi_pembayaran_ukt/model/get_jurusan/jurusan.dart';

abstract class JurusanRepository{
  Future<List<Jurusan>?> getJurusan();
}