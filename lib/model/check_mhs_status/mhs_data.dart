class MhsData {
  MhsData({
      this.nama, 
      this.nim, 
      this.jurusan, 
      this.semester,});

  MhsData.fromJson(dynamic json) {
    nama = json['nama'];
    nim = json['nim'];
    jurusan = json['jurusan'];
    semester = json['semester'].toString();
  }

  String? nama;
  String? nim;
  String? jurusan;
  String? semester;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nama'] = nama;
    map['nim'] = nim;
    map['jurusan'] = jurusan;
    map['semester'] = semester;
    return map;
  }

}