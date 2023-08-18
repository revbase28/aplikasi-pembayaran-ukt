import 'detail_ukt_semester_data.dart';

class DetailUktSemesterResponse {
  DetailUktSemesterResponse({
      this.semester, 
      this.jurusan, 
      this.data,});

  DetailUktSemesterResponse.fromJson(dynamic json) {
    semester = json['semester'];
    jurusan = json['jurusan'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(DetailUktSemesterData.fromJson(v));
      });
    }
  }
  int? semester;
  String? jurusan;
  List<DetailUktSemesterData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['semester'] = semester;
    map['jurusan'] = jurusan;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}