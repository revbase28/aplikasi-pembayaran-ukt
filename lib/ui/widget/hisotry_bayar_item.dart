import 'package:flutter/material.dart';

import '../../core/theme.dart';

class HistoryBayarItem extends StatelessWidget {
  final String date;
  final String value;
  final int semester;

  const HistoryBayarItem({Key? key, required this.date, required this.value, required this.semester}) : super(key: key);

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
            Text(date, style: greyTextStyle),
            const SizedBox(height: 12),
            FittedBox(
                child: Text(value, style: greenTextStyle.copyWith(fontSize: 20, fontWeight: semiBold))),
            const SizedBox(height: 12),
            Text("Kewajiban semester $semester", style: blackTextStyle.copyWith(fontWeight: medium))
          ],
        ));
  }
}
