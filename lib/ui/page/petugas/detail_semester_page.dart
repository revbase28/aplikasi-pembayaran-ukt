import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/auth_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/back_icon_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/detail_progress_bayar_mahasiswa_item.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/progress_bayar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/jurusan_cubit.dart';
import '../../../model/get_jurusan/jurusan.dart';

class DetailSemesterPage extends StatefulWidget {
  const DetailSemesterPage({Key? key}) : super(key: key);

  @override
  State<DetailSemesterPage> createState() => _DetailSemesterPageState();
}

class _DetailSemesterPageState extends State<DetailSemesterPage> {
  // Initial Selected Value
  int dropdownvalue = 0;
  String dropdownValueText = '';

  // List of items in our dropdown menu
  var items = [
    'Teknik Informatika',
    'Teknik Pertambangan dan Kelautan',
    'Bisnis dan Usaha Kecil Menengah',
  ];


  @override
  void initState() {
    context.read<JurusanCubit>().getJurusanList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget jurusanDropdown() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Pilih Jurusan",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18)),
          const SizedBox(width: 10),
          BlocConsumer<JurusanCubit, JurusanState>(
            listener: (context, state) {
              if(state is JurusanSuccess){
                setState(() {
                  dropdownvalue = state.jurusanList[0].id!;
                  dropdownValueText = state.jurusanList[0].name!;
                });
              }
              // TODO: When success get detail ukt data for item[0]
            },
            builder: (context, state) {
              if(state is JurusanSuccess){
                return Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kInactiveColor)),
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      style: blackTextStyle.copyWith(fontSize: 16),
                      underline: const SizedBox(),
                      items: state.jurusanList.map((Jurusan items) {
                        return DropdownMenuItem(
                          value: items.id,
                          child: Text(items.name!, overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          dropdownValueText = state.jurusanList.firstWhere((element) => element.id == newValue).name!;
                        });
                      },
                    ),
                  ),
                );
              } else if(state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else {
                return const SizedBox();
              }
            },
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
                    image: DecorationImage(
                        image: AssetImage("assets/img/bg_detail_semester.png"),
                        fit: BoxFit.cover)),
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
                    padding: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        bottom: defaultMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Semester 1",
                            style: whiteTextStyle.copyWith(
                                fontWeight: medium, fontSize: 26)),
                        const SizedBox(height: 4),
                        Text("Tahun ajaran 2022/2023", style: whiteTextStyle),
                        const SizedBox(height: 33),
                        const ProgressBayarCard(
                            value: "Rp. 20.000.000", percentage: 0.87),
                        const SizedBox(height: 24),
                        jurusanDropdown(),
                        const SizedBox(height: 16),
                        Text(dropdownValueText,
                            style: blackTextStyle.copyWith(fontSize: 16)),
                        const SizedBox(height: 20),
                        const DetailProgressBayarMahasiswaItem(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
