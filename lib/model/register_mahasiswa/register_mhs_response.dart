class RegisterMhsResponse {
  RegisterMhsResponse({
      this.nim, 
      this.message,});

  RegisterMhsResponse.fromJson(dynamic json) {
    nim = json['nim'];
    message = json['message'];
  }

  String? nim;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nim'] = nim;
    map['message'] = message;
    return map;
  }

}