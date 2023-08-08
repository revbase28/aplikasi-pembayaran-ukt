import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/petugas_detail_per_semester_item.dart';
import 'package:flutter/material.dart';

class PetugasDashboardPage extends StatelessWidget {
  const PetugasDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget moneyInCard() {
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
              child: Text("Rp 280.000.000",
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
        Text("Halo Petugas",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24)),
        Text("Tahun ajaran 2022/2023",
            style: greyTextStyle.copyWith(fontSize: 16)),
        const SizedBox(height: 16),
        moneyInCard(),
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
              Navigator.pushNamed(context, RouteConsants.tambahAkunMhs);
            }),
        const SizedBox(height: 24),
        Text("Detail Per Semester",
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18)),
        const SizedBox(height: 16),
        PetugasDetailPerSemesterItem(
            semester: 1,
            value: "Rp. 20.000.000",
            onDetailClick: () {
              Navigator.pushNamed(context, RouteConsants.detailSemester);
            },
            percentage: 0.3),
        PetugasDetailPerSemesterItem(
            semester: 2,
            value: "Rp. 20.000.000.000.000.000",
            onDetailClick: () {},
            percentage: 1),
        PetugasDetailPerSemesterItem(
            semester: 3,
            value: "Rp. 90.000.000",
            onDetailClick: () {},
            percentage: 0.5),
        PetugasDetailPerSemesterItem(
            semester: 4,
            value: "Rp. 100.000",
            onDetailClick: () {},
            percentage: 0.1),
        PetugasDetailPerSemesterItem(
            semester: 5,
            value: "Rp. 70.000",
            onDetailClick: () {},
            percentage: 0.1),
        PetugasDetailPerSemesterItem(
            semester: 6,
            value: "Rp. 823.000.000",
            onDetailClick: () {},
            percentage: 0.6),
        PetugasDetailPerSemesterItem(
            semester: 7,
            value: "Rp. 7.000.000",
            onDetailClick: () {},
            percentage: 0.11),
        PetugasDetailPerSemesterItem(
            semester: 8,
            value: "Rp. 5.000.000",
            onDetailClick: () {},
            percentage: 0.07),
      ],
    )));
  }
}