import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/tools/shared_pref_util.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/mahasiswa_dashboard_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/placeholder.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/progress_bayar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme.dart';
import '../../../core/tools/util.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../model/mahasiswa_dashboard/progress_bayar.dart';

class MahasiswaDashboardPage extends StatefulWidget {
  const MahasiswaDashboardPage({Key? key}) : super(key: key);

  @override
  State<MahasiswaDashboardPage> createState() => _MahasiswaDashboardPageState();
}

class _MahasiswaDashboardPageState extends State<MahasiswaDashboardPage> {

  String tahunAjaran = "";
  String semester = SharedPrefUtil.getSemester();
  @override
  void initState() {
    context.read<MahasiswaDashboardCubit>().getMahasiswaDahboardData();
    super.initState();
  }

  Widget screenLoadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
            baseColor: kShimmerBaseColor,
            highlightColor: kShimmerHighligtColor,
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            )),
        const SizedBox(height: 10),
        Shimmer.fromColors(
            baseColor: kShimmerBaseColor,
            highlightColor: kShimmerHighligtColor,
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            )),
        const SizedBox(height: 12),
        Shimmer.fromColors(
            baseColor: kShimmerBaseColor,
            highlightColor: kShimmerHighligtColor,
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            )),
        const SizedBox(height: 30),
        SingleLinePlaceholder(lineWidth: 150, lineHeight: 25),
        const SizedBox(height: 16),
        ProgressBayarCardPlaceholder(),
        ProgressBayarCardPlaceholder(),
        ProgressBayarCardPlaceholder(),
        ProgressBayarCardPlaceholder(),
        ProgressBayarCardPlaceholder(),
        ProgressBayarCardPlaceholder(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog logOutConfirmationDialog() {
      Widget cancelButton = ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade500),
        child: Text("Cancel", style: whiteTextStyle),
        onPressed: () {
          Navigator.pop(context);
        },
      );

      Widget confirmButton = TextButton(
        child: Text(
          "Yakin",
          style: redTextStyle.copyWith(color: Colors.red.shade500),
        ),
        onPressed: () {
          context.read<AuthCubit>().logout();
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        },
      );

      return AlertDialog(
        title: Text("Anda yakin ingin logout"),
        actions: [cancelButton, confirmButton],
      );
    }

    Widget tagihanBayarCard(String tunggakan) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/img/bg_card.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(0, 10))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(SharedPrefUtil.getName() ?? "",
                style: whiteTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold)),
            const SizedBox(height: 4),
            Text(semester.isDigit() ? "Semester $semester" : semester,
                style: whiteTextStyle),
            const SizedBox(height: 30),
            Text("Sisa Kewajiban Bayar",
                style: whiteTextStyle.copyWith(fontWeight: light)),
            FittedBox(
              child: Text(tunggakan,
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 26)),
            )
          ],
        ),
      );
    }

    Widget progressPembayaran(List<ProgressBayar> data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data
            .map((ProgressBayar e) =>
            ProgressBayarCard(
              uangMasuk: Util.formatToIdr(e.uangMasuk!),
              percentage: e.presentaseUangMasuk!,
              tunggakan: Util.formatToIdr(e.tunggakan!),
              semester: e.semester!,
              status: e.status!,
            ))
            .toList(),
      );
    }

    return SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(defaultMargin),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Selamat Datang",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24)),
                        const SizedBox(height: 4),
                        Text("Tahun ajaran $tahunAjaran",
                            style: greyTextStyle.copyWith(
                                fontWeight: light, fontSize: 16)),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => logOutConfirmationDialog());
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              const SizedBox(height: 16),
              BlocConsumer<MahasiswaDashboardCubit, MahasiswaDashboardState>(
                listener: (context, state) {
                  if(state is MahasiswaDashboardSuccess){
                    setState(() {
                      tahunAjaran = state.data.tahunAjaran!;
                    });
                  }
                },
                builder: (context, state) {
                  if(state is MahasiswaDashboardSuccess){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        tagihanBayarCard(
                            Util.formatToIdr(state.data.totalTunggakan!)),
                        const SizedBox(height: 20),
                        GenericButton(
                            buttonTitle: "Lakukan Pembayaran",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteConsants.pembayaran);
                            }),
                        const SizedBox(height: 12),
                        GenericButton(
                            buttonTitle: "History Bayar",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteConsants.historyPembayaran);
                            },
                            outlineStyled: true),
                        const SizedBox(height: 30),
                        Text("Progress Pembayaran",
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 18)),
                        const SizedBox(height: 16),
                        progressPembayaran(state.data.progressBayar!),
                      ],
                    );
                  }

                  if(state is MahasiswaDashboardLoading){
                    return screenLoadingState();
                  }

                  if(state is MahasiswaDashboardFailed){
                    return Center(
                      child: Text(state.msg,
                          style: redTextStyle),
                    );
                  }

                  return const SizedBox();
                },
              )
            ],
          ),
        ));
  }
}
