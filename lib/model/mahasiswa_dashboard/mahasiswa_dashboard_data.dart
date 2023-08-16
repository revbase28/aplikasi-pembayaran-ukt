import 'package:aplikasi_pembayaran_ukt/model/mahasiswa_dashboard/progress_bayar.dart';

class MahasiswaDashboardData {
  MahasiswaDashboardData({
      this.tahunAjaran, 
      this.totalTunggakan, 
      this.progressBayar,});

  MahasiswaDashboardData.fromJson(dynamic json) {
    tahunAjaran = json['tahun_ajaran'];
    totalTunggakan = json['total_tunggakan'];
    if (json['progress_bayar'] != null) {
      progressBayar = [];
      json['progress_bayar'].forEach((v) {
        progressBayar!.add(ProgressBayar.fromJson(v));
      });
    }
  }
  String? tahunAjaran;
  int? totalTunggakan;
  List<ProgressBayar>? progressBayar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tahun_ajaran'] = tahunAjaran;
    map['total_tunggakan'] = totalTunggakan;
    if (progressBayar != null) {
      map['progress_bayar'] = progressBayar!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}