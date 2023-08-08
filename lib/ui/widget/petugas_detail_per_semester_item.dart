import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PetugasDetailPerSemesterItem extends StatelessWidget {
  final int semester;
  final String value;
  final Function onDetailClick;
  final double percentage;

  const PetugasDetailPerSemesterItem(
      {Key? key,
      required this.semester,
      required this.value,
      required this.onDetailClick,
      required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text("Semester $semester",
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium)),
          const SizedBox(height: 8),
          Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    width: 77,
                    height: 77,
                    child: PieChart(PieChartData(
                        centerSpaceRadius: 27,
                        borderData: FlBorderData(show: false),
                        sections: [
                          PieChartSectionData(
                              value: percentage,
                              showTitle: false,
                              color: kGreenColor,
                              radius: 10),
                          PieChartSectionData(
                              value: 1 - percentage,
                              showTitle: false,
                              color: kRedColor,
                              radius: 10),
                        ])),
                  ),
                  Text("${(percentage * 100).toInt()}%",
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium))
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: Text(value,
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: semiBold))),
                    const SizedBox(height: 13),
                    GenericButton(
                        buttonTitle: "Lihat Detail",
                        onPressed: (){
                          onDetailClick();
                        },
                        height: 35,
                        fontSize: 14,
                        radius: 8,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
