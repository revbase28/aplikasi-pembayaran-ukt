import 'mhs_data.dart';

class CheckMhsAccStatusResponse {
  CheckMhsAccStatusResponse({
      this.status, 
      this.data,});

  CheckMhsAccStatusResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? MhsData.fromJson(json['data']) : null;
  }
  String? status;
  MhsData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}