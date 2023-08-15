class HistoryTransaksi {
  HistoryTransaksi({
      this.dateTime, 
      this.totalTransaksi, 
      this.semester,});

  HistoryTransaksi.fromJson(dynamic json) {
    dateTime = json['date_time'];
    totalTransaksi = json['total_transaksi'];
    semester = json['semester'];
  }

  String? dateTime;
  int? totalTransaksi;
  int? semester;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date_time'] = dateTime;
    map['total_transaksi'] = totalTransaksi;
    map['semester'] = semester;
    return map;
  }

}