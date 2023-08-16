import 'dart:ffi';

class DetailPerSemester {
  DetailPerSemester({
      this.semester, 
      this.uangMasuk, 
      this.tunggakan, 
      this.presentaseUangMasuk,});

  DetailPerSemester.fromJson(dynamic json) {
    semester = json['semester'];
    uangMasuk = json['uang_masuk'];
    tunggakan = json['tunggakan'];
    presentaseUangMasuk = double.parse(json['presentase_uang_masuk'].toString());
  }

  int? semester;
  int? uangMasuk;
  int? tunggakan;
  double? presentaseUangMasuk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['semester'] = semester;
    map['uang_masuk'] = uangMasuk;
    map['tunggakan'] = tunggakan;
    map['presentase_uang_masuk'] = presentaseUangMasuk;
    return map;
  }

}