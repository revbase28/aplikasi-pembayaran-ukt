import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/petugas_dashboard_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/petugas_detail_per_semester_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/tools/util.dart';
import '../../../cubit/auth_cubit.dart';
import '../../../model/petugas_dashboard/detail_per_semester.dart';
import '../../widget/placeholder.dart';

class PetugasDashboardPage extends StatefulWidget {
  const PetugasDashboardPage({Key? key}) : super(key: key);

  @override
  State<PetugasDashboardPage> createState() => _PetugasDashboardPageState();
}

class _PetugasDashboardPageState extends State<PetugasDashboardPage> {

  @override
  void initState() {
    context.read<PetugasDashboardCubit>().getPetugasDahboardData();
    super.initState();
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
        title: const Text("Anda yakin ingin logout"),
        actions: [cancelButton, confirmButton],
      );
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
                height: 110,
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
          const SizedBox(height: 24),
          const SingleLinePlaceholder(lineWidth: 150, lineHeight: 25),
          const SizedBox(height: 16),
          const PetugasDetailPerSemesterPlaceholder(),
          const PetugasDetailPerSemesterPlaceholder(),
          const PetugasDetailPerSemesterPlaceholder(),
          const PetugasDetailPerSemesterPlaceholder(),
          const PetugasDetailPerSemesterPlaceholder()
        ],
      );
    }

    Widget moneyInCard(int value) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/img/bg_card.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  blurRadius: 50,
                  offset: const Offset(0, 10))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Uang Masuk",
                style: whiteTextStyle.copyWith(fontWeight: light)),
            FittedBox(
              child: Text(Util.formatToIdr(value),
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 26)),
            )
          ],
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
            body: ListView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Halo Petugas",
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24)),
            ),
            const SizedBox(width: 8),
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
        BlocBuilder<PetugasDashboardCubit, PetugasDashboardState>(
          builder: (context, state) {
            if (state is PetugasDashboardSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  moneyInCard(state.data.totalUangMasuk!),
                  const SizedBox(height: 10),
                  GenericButton(
                      buttonTitle: 'Tambah Akun Mahasiswa',
                      child: (buttonTitle) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: kWhiteColor),
                            const SizedBox(width: 4),
                            Text(buttonTitle,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 18, fontWeight: medium))
                          ],
                        );
                      },
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteConsants.tambahAkunMhs);
                      }),
                  const SizedBox(height: 24),
                  Text("Detail Per Semester",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18)),
                  const SizedBox(height: 16),
                  Column(
                    children: state.data.detailPerSemester!
                        .map((DetailPerSemester item) =>
                            PetugasDetailPerSemesterItem(
                                semester: item.semester!,
                                value: Util.formatToIdr(item.uangMasuk!),
                                onDetailClick: () {
                                  Navigator.pushNamed(context, RouteConsants.detailSemester, arguments: item);
                                },
                                percentage: item.presentaseUangMasuk!))
                        .toList(),
                  )
                ],
              );
            }

            if (state is PetugasDashboardLoading) {
              return screenLoadingState();
            }

            if (state is PetugasDashboardFailed) {
              return Center(
                child: Text(state.msg,
                    style: redTextStyle),
              );
            }

            return const SizedBox();
          },
        )
      ],
    )));
  }
}
