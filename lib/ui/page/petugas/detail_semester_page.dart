import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/back_icon_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/detail_progress_bayar_mahasiswa_item.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/progress_bayar_card.dart';
import 'package:flutter/material.dart';

class DetailSemesterPage extends StatefulWidget {
  const DetailSemesterPage({Key? key}) : super(key: key);

  @override
  State<DetailSemesterPage> createState() => _DetailSemesterPageState();
}

class _DetailSemesterPageState extends State<DetailSemesterPage> {
  // Initial Selected Value
  String dropdownvalue = 'Teknik Informatika';

  // List of items in our dropdown menu
  var items = [
    'Teknik Informatika',
    'Teknik Pertambangan dan Kelautan',
    'Bisnis dan Usaha Kecil Menengah',
  ];

  @override
  Widget build(BuildContext context) {

    Widget jurusanDropdown(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Pilih Jurusan", style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18)),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kInactiveColor)
              ),
              child: DropdownButton(
                isExpanded: true,
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                style: blackTextStyle.copyWith(fontSize: 16),
                underline: const SizedBox(),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items, overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
        ],
      );
    }
    return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/img/bg_detail_semester.png"), fit: BoxFit.cover)
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8, top: 8),
                        child: BackIconButton(),
                      ),
                      const SizedBox(height: 21),
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Semester 1", style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 26)),
                            const SizedBox(height: 4),
                            Text("Tahun ajaran 2022/2023", style: whiteTextStyle),
                            const SizedBox(height: 33),
                            const ProgressBayarCard(value: "Rp. 20.000.000", percentage: 0.87),
                            const SizedBox(height: 24),
                            jurusanDropdown(),
                            const SizedBox(height: 16),
                            Text(dropdownvalue, style: blackTextStyle.copyWith(fontSize: 16)),
                            const SizedBox(height: 20),
                            const DetailProgressBayarMahasiswaItem(),
                          ],
                        ),
                      ),
                    ],
                  )],
              )
            ],
          ),
        )
    );
  }
}
