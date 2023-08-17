class MahasiswaData {
  MahasiswaData({
      this.id, 
      this.name, 
      this.nim, 
      this.address, 
      this.phoneNumber, 
      this.tahunAjaran,
      this.jurusan,});

  MahasiswaData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nim = json['nim'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    tahunAjaran = json['tahunAjaran'];
    jurusan = json['jurusan'];
    semester = json['semester'].toString();
  }

  int? id;
  String? name;
  String? nim;
  String? address;
  String? phoneNumber;
  String? tahunAjaran;
  String? jurusan;
  String? semester;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nim'] = nim;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['tahunAjaran'] = tahunAjaran;
    map['jurusan'] = jurusan;
    map['semester'] = semester;
    return map;
  }

}