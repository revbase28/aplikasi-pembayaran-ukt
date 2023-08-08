import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/progress_bayar_card.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/theme.dart';

class MahasiswaDashboardPage extends StatelessWidget {
  const MahasiswaDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tagihanBayarCard() {
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
            Text("Nama Mahasiswa",
                style: whiteTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold)),
            const SizedBox(height: 4),
            Text("Semester 2", style: whiteTextStyle),
            const SizedBox(height: 30),
            Text("Sisa Kewajiban Bayar",
                style: whiteTextStyle.copyWith(fontWeight: light)),
            FittedBox(
              child: Text("Rp 280.000.000.000.000",
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 26)),
            )
          ],
        ),
      );
    }

    Widget progressPembayaran() {
      return Column(
        children: [
          Text("Progress Pembayaran", style: blackTextStyle.copyWith(
              fontWeight: semiBold, fontSize: 18)),
          const SizedBox(height: 16),
          const ProgressBayarCard(value: "Rp. 7.000.000.000",
              percentage: 1,
              semester: 1,
              status: StatusProgressBayarConstants.lunas),
          const ProgressBayarCard(
              value: "Rp. 3.500.000.000", percentage: 0.5, semester: 2),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 3,
              status: StatusProgressBayarConstants.belumBisa),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 4,
              status: StatusProgressBayarConstants.belumBisa),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 5,
              status: StatusProgressBayarConstants.belumBisa),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 6,
              status: StatusProgressBayarConstants.belumBisa),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 7,
              status: StatusProgressBayarConstants.belumBisa),
          const ProgressBayarCard(value: "0",
              percentage: 0,
              semester: 8,
              status: StatusProgressBayarConstants.belumBisa),
        ],
      );
    }

    return SafeArea(
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.all(defaultMargin),
            children: [
              Text("Selamat Datang",
                  style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24)),
              const SizedBox(height: 4),
              Text("Tahun ajaran 2022/2023",
                  style: greyTextStyle.copyWith(
                      fontWeight: light, fontSize: 16)),
              const SizedBox(height: 16),
              tagihanBayarCard(),
              const SizedBox(height: 20),
              GenericButton(buttonTitle: "Lakukan Pembayaran", onPressed: () {
                Navigator.pushNamed(context, RouteConsants.pembayaran);
              }),
              const SizedBox(height: 12),
              GenericButton(buttonTitle: "History Bayar",
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteConsants.historyPembayaran);
                  },
                  outlineStyled: true),
              const SizedBox(height: 30),
              progressPembayaran()
            ],
          ),
        ));
  }
}
