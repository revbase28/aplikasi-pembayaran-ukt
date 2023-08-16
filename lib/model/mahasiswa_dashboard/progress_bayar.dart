class ProgressBayar {
  ProgressBayar({
      this.semester, 
      this.status, 
      this.uangMasuk, 
      this.tunggakan, 
      this.presentaseUangMasuk,});

  ProgressBayar.fromJson(dynamic json) {
    semester = json['semester'];
    status = json['status'];
    uangMasuk = json['uang_masuk'];
    tunggakan = json['tunggakan'];
    presentaseUangMasuk = double.parse(json['presentase_uang_masuk'].toString());
  }
  int? semester;
  String? status;
  int? uangMasuk;
  int? tunggakan;
  double? presentaseUangMasuk;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['semester'] = semester;
    map['status'] = status;
    map['uang_masuk'] = uangMasuk;
    map['tunggakan'] = tunggakan;
    map['presentase_uang_masuk'] = presentaseUangMasuk;
    return map;
  }

}