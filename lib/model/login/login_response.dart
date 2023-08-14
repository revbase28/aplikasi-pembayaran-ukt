

import 'mahasiswa.dart';

class LoginResponse {
  LoginResponse({
      this.token, 
      this.role, 
      this.data,});

  LoginResponse.fromJson(dynamic json) {
    token = json['token'];
    role = json['role'];
    data = json['data'] != null ? MahasiswaData.fromJson(json['data']) : null;
  }
  String? token;
  String? role;
  MahasiswaData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['role'] = role;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}