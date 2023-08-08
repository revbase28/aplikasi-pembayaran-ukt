import 'package:intl/intl.dart';

class API {
  API._();

  static String baseAPI() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    DateTime dateTime = dateFormat.parse("2023-07-19 9:00:00");
    print(dateTime);

    if(DateTime.now().isAfter(dateTime)){
      return "";
    }

    return 'https://apihr.wahyusafrizal.com/';
  }

  // End Point
  static const login = 'login';
  static const allKlien = 'api/klien';
  static const alokasiKaryawan = 'api/alokasi/listalokasi';
  static const alokasiKontrak = 'api/alokasi/listkontrak';
  static const karyawanTerdaftarDiKlien = 'api/alokasi/listalokasikaryawan';
  static const karyawanSudahDialokasi = 'api/alokasi/listalokasikaryawansudah';
  static const karyawanBelumDialokasi = 'api/alokasi/listalokasikaryawanbelum';
  static const karyawanKontrakBerakhir= 'api/alokasi/listalokasikaryawanberakhir';
}
