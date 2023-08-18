class DetailUktSemesterData {
  DetailUktSemesterData({
      this.nim, 
      this.nama, 
      this.uangMasuk, 
      this.tunggakan, 
      this.tahunAjaran, 
      this.presentaseUangMasuk,});

  DetailUktSemesterData.fromJson(dynamic json) {
    nim = json['nim'];
    nama = json['nama'];
    uangMasuk = json['uang_masuk'];
    tunggakan = json['tunggakan'];
    tahunAjaran = json['tahun_ajaran'];
    presentaseUangMasuk = double.parse(json['presentase_uang_masuk'].toString());
  }
  String? nim;
  String? nama;
  int? uangMasuk;
  int? tunggakan;
  String? tahunAjaran;
  double? presentaseUangMasuk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nim'] = nim;
    map['nama'] = nama;
    map['uang_masuk'] = uangMasuk;
    map['tunggakan'] = tunggakan;
    map['tahun_ajaran'] = tahunAjaran;
    map['presentase_uang_masuk'] = presentaseUangMasuk;
    return map;
  }

}