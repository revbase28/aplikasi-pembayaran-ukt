class CheckTagihanResponse {
  CheckTagihanResponse({
      this.semester, 
      this.tagihan,});

  CheckTagihanResponse.fromJson(dynamic json) {
    semester = json['semester'];
    tagihan = json['tagihan'];
  }

  int? semester;
  int? tagihan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['semester'] = semester;
    map['tagihan'] = tagihan;
    return map;
  }

}