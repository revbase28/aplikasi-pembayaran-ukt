class MahasiswaData {
  MahasiswaData({
      this.id, 
      this.name, 
      this.nim, 
      this.address, 
      this.phoneNumber, 
      this.tahunAjaranId, 
      this.jurusanId,});

  MahasiswaData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nim = json['nim'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    tahunAjaranId = json['tahunAjaranId'];
    jurusanId = json['jurusanId'];
  }
  int? id;
  String? name;
  String? nim;
  String? address;
  String? phoneNumber;
  int? tahunAjaranId;
  int? jurusanId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nim'] = nim;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['tahunAjaranId'] = tahunAjaranId;
    map['jurusanId'] = jurusanId;
    return map;
  }

}