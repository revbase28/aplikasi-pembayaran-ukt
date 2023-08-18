class BayarTagihanResponse {
  BayarTagihanResponse({
      this.nim, 
      this.semester, 
      this.snapToken,});

  BayarTagihanResponse.fromJson(dynamic json) {
    nim = json['nim'];
    semester = json['semester'];
    snapToken = json['snapToken'];
  }
  String? nim;
  int? semester;
  String? snapToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nim'] = nim;
    map['semester'] = semester;
    map['snapToken'] = snapToken;
    return map;
  }

}