import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressBayarCard extends StatelessWidget {
  final int? semester;
  final String uangMasuk;
  final String tunggakan;
  final double percentage;
  final String status;

  const ProgressBayarCard(
      {Key? key,
      this.semester,
      required this.uangMasuk,
      required this.percentage,
      this.status = StatusProgressBayarConstants.onProgress,
      required this.tunggakan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String handlePercentage() {
      if (status == StatusProgressBayarConstants.belumBisa) {
        return "N/A";
      }

      return "${(percentage * 100).toInt()}%";
    }

    Widget handleStatusValue() {
      if (status == StatusProgressBayarConstants.belumBisa) {
        return Column(
          children: [
            Text("BELUM BISA DIBAYAR",
                style:
                    greyTextStyle.copyWith(fontWeight: semiBold, fontSize: 25))
          ],
        );
      } else if (status == StatusProgressBayarConstants.lunas) {
        return Column(
          children: [
            Text("LUNAS",
                style:
                    greenTextStyle.copyWith(fontWeight: semiBold, fontSize: 25))
          ],
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Uang Masuk", style: blackTextStyle.copyWith(fontSize: 12)),
          FittedBox(
              child: Text(uangMasuk,
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold, color: kGreenColor))),
          const SizedBox(height: 10),
          Text("Belum Dibayar", style: blackTextStyle.copyWith(fontSize: 12)),
          FittedBox(
              child: Text(tunggakan,
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold, color: kRedColor))),
        ],
      );
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
                color: kBlackColor.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          semester != null
              ? Text("Semester $semester",
                  style:
                      blackTextStyle.copyWith(fontSize: 16, fontWeight: medium))
              : const SizedBox(),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: 105,
                    height: 105,
                    child: PieChart(PieChartData(
                        centerSpaceRadius: 37,
                        borderData: FlBorderData(show: false),
                        sections: [
                          PieChartSectionData(
                              value: percentage,
                              showTitle: false,
                              color: status ==
                                      StatusProgressBayarConstants.belumBisa
                                  ? kGreyColor
                                  : kGreenColor,
                              radius: 15),
                          PieChartSectionData(
                              value: 1 - percentage,
                              showTitle: false,
                              color: status ==
                                      StatusProgressBayarConstants.belumBisa
                                  ? kGreyColor
                                  : kRedColor,
                              radius: 15),
                        ])),
                  ),
                  Text(handlePercentage(),
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium))
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: handleStatusValue(),
              )
            ],
          )
        ],
      ),
    );
  }
}
