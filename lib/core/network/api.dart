import 'package:intl/intl.dart';

class API {
  API._();

  static String baseAPI() {
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    //
    // DateTime dateTime = dateFormat.parse("2023-07-19 9:00:00");
    // print(dateTime);
    //
    // if(DateTime.now().isAfter(dateTime)){
    //   return "";
    // }

    return 'https://ukt.greckminas.com/';
  }

  // End Point
  static const login = 'login';
  static const jurusan = 'petugas/jurusan';
  static const historyTransaksi = 'mahasiswa/historiTransaksi';
}
