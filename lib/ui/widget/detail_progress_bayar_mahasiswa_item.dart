import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:flutter/material.dart';

class DetailProgressBayarMahasiswaItem extends StatelessWidget {
  const DetailProgressBayarMahasiswaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: kBlackColor.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama Mahasiswa",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Uang Masuk",
                        style: greyTextStyle.copyWith(
                            fontWeight: light, fontSize: 12)),
                    FittedBox(
                        child: Text("Rp. 19.000.000.000.000.000.000",
                            style: greenTextStyle.copyWith(
                                fontWeight: medium, fontSize: 16))),
                    const SizedBox(height: 8),
                    Text("Belum dibayar",
                        style: greyTextStyle.copyWith(
                            fontWeight: light, fontSize: 12)),
                    FittedBox(
                        child: Text("Rp. 19.000.000",
                            style: redTextStyle.copyWith(
                                fontWeight: medium, fontSize: 16)))
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text("87%",
                          style: purpleTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 30)),
                      Text("Persentase\nSelesai Bayar",
                          style: greyTextStyle.copyWith(
                              fontWeight: light, fontSize: 12),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
