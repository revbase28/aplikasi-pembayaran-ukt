import 'package:aplikasi_pembayaran_ukt/ui/page/login_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/history_pembayaran_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/lakukan_pembayaran_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/mahasiswa_dashboard_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/detail_semester_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/petugas_dashboard_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/tambah_akun_mahasiswa.dart';
import 'package:flutter/material.dart';

import 'core/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        RouteConsants.petugasDashboardRoute: (context) => const PetugasDashboardPage(),
        RouteConsants.detailSemester : (context) => const DetailSemesterPage(),
        RouteConsants.tambahAkunMhs: (context) => TambahAkunMahasiswaPage(),
        RouteConsants.mahasiswaDashboardRoute: (context) => const MahasiswaDashboardPage(),
        RouteConsants.pembayaran: (context) => const PembayaranPage(),
        RouteConsants.historyPembayaran: (context) => const HistoryPembayaranPage(),
      },
    );
  }
}
