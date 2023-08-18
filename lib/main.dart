import 'package:aplikasi_pembayaran_ukt/cubit/bayar_tagihan_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/check_mhs_acc_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/check_tagihan_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/detail_ukt_semester_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/history_transaksi_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/jurusan_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/mahasiswa_dashboard_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/petugas_dashboard_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/register_mhs_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/model/get_detail_ukt_semester/detail_ukt_semester_response.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/login_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/history_pembayaran_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/lakukan_pembayaran_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/mahasiswa_dashboard_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/mahasiswa/payment_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/detail_semester_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/petugas_dashboard_page.dart';
import 'package:aplikasi_pembayaran_ukt/ui/page/petugas/tambah_akun_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/const.dart';
import 'cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Shared Pref Init
  await initialize();

  await initializeDateFormatting('id_ID', null).then((value) => null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => JurusanCubit()),
        BlocProvider(create: (context) => HistoryTransaksiCubit()),
        BlocProvider(create: (context) => PetugasDashboardCubit()),
        BlocProvider(create: (context) => MahasiswaDashboardCubit()),
        BlocProvider(create: (context) => CheckMhsAccCubit()),
        BlocProvider(create: (context) => RegisterMhsCubit()),
        BlocProvider(create: (context) => CheckTagihanCubit()),
        BlocProvider(create: (context) => DetailUktSemesterCubit()),
        BlocProvider(create: (context) => BayarTagihanCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LoginPage(),
          RouteConsants.petugasDashboardRoute: (context) =>
              const PetugasDashboardPage(),
          RouteConsants.detailSemester: (context) => const DetailSemesterPage(),
          RouteConsants.tambahAkunMhs: (context) => TambahAkunMahasiswaPage(),
          RouteConsants.mahasiswaDashboardRoute: (context) =>
              const MahasiswaDashboardPage(),
          RouteConsants.pembayaran: (context) => const PembayaranPage(),
          RouteConsants.historyPembayaran: (context) =>
              const HistoryPembayaranPage(),
          RouteConsants.payment: (context) => const PaymentPage()
        },
      ),
    );
  }
}
