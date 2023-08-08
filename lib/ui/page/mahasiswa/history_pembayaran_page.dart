import 'package:aplikasi_pembayaran_ukt/ui/widget/hisotry_bayar_item.dart';
import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../widget/back_icon_button.dart';

class HistoryPembayaranPage extends StatelessWidget {
  const HistoryPembayaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: BackIconButton(color: kBlackColor),
              )),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("History Pembayaran",
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 24)),
                const SizedBox(height: 20),
                const HistoryBayarItem(
                    date: "11 Agustus 2023",
                    value: "Rp. 19.000.000",
                    semester: 2),
                const HistoryBayarItem(
                    date: "1 Agustus 2023",
                    value: "Rp. 1.000.000",
                    semester: 1),
                const HistoryBayarItem(
                    date: "18 Juli 2023", value: "Rp. 9.000.000", semester: 1)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
