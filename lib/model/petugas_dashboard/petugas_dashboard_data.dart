import 'detail_per_semester.dart';

class PetugasDashboardData {
  PetugasDashboardData({
      this.totalUangMasuk, 
      this.detailPerSemester,});

  PetugasDashboardData.fromJson(dynamic json) {
    totalUangMasuk = json['total_uang_masuk'];
    if (json['detail_per_semester'] != null) {
      detailPerSemester = [];
      json['detail_per_semester'].forEach((v) {
        detailPerSemester!.add(DetailPerSemester.fromJson(v));
      });
    }
  }

  int? totalUangMasuk;
  List<DetailPerSemester>? detailPerSemester;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_uang_masuk'] = totalUangMasuk;
    if (detailPerSemester != null) {
      map['detail_per_semester'] = detailPerSemester!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}