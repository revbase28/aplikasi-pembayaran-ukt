import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/auth_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/detail_ukt_semester_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/model/get_detail_ukt_semester/detail_ukt_semester_data.dart';
import 'package:aplikasi_pembayaran_ukt/model/petugas_dashboard/detail_per_semester.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/back_icon_button.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/detail_progress_bayar_mahasiswa_item.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/progress_bayar_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/tools/util.dart';
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

  @override
  void initState() {
    context.read<JurusanCubit>().getJurusanList();
    context.read<DetailUktSemesterCubit>().setToInitialState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailPerSemester;

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
              if (state is JurusanSuccess) {
                setState(() {
                  dropdownvalue = state.jurusanList[0].id!;
                  dropdownValueText = state.jurusanList[0].name!;
                });

                context.read<DetailUktSemesterCubit>().getDetailUktSemester(
                    args.semester!.toString(),
                    state.jurusanList[0].id!.toString());
              }
            },
            builder: (context, state) {
              if (state is JurusanSuccess) {
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
                          child: Text(items.name!,
                              overflow: TextOverflow.ellipsis),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          dropdownValueText = state.jurusanList
                              .firstWhere((element) => element.id == newValue)
                              .name!;
                        });

                        context
                            .read<DetailUktSemesterCubit>()
                            .getDetailUktSemester(args.semester!.toString(),
                                newValue!.toString());
                      },
                    ),
                  ),
                );
              } else if (state is JurusanLoading) {
                return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else if (state is JurusanFailed) {
                return Center(
                  child: Text(state.msg, style: redTextStyle),
                );
              }

              return const SizedBox();
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
                        Text("Semester ${args.semester!}",
                            style: whiteTextStyle.copyWith(
                                fontWeight: medium, fontSize: 26)),
                        const SizedBox(height: 33),
                        ProgressBayarCard(
                          uangMasuk: Util.formatToIdr(args.uangMasuk!),
                          percentage: args.presentaseUangMasuk!,
                          tunggakan: Util.formatToIdr(args.tunggakan!),
                        ),
                        const SizedBox(height: 24),
                        jurusanDropdown(),
                        const SizedBox(height: 16),
                        Text(dropdownValueText,
                            style: blackTextStyle.copyWith(fontSize: 16)),
                        const SizedBox(height: 20),
                        BlocBuilder<DetailUktSemesterCubit,
                            DetailUktSemesterState>(
                          builder: (context, state) {
                            if (state is DetailUktSemesterSuccess) {
                              if (state.response.data!.isEmpty) {
                                return Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/img/ill_empty.png"),
                                              fit: BoxFit.fitHeight)),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Tidak ada data",
                                      style: purpleTextStyle.copyWith(
                                          fontWeight: semiBold, fontSize: 16),
                                    )
                                  ],
                                );
                              }
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.response.data!
                                      .map((DetailUktSemesterData e) =>
                                          DetailProgressBayarMahasiswaItem(
                                            namaMahasiswa: e.nama!,
                                            uangMasuk:
                                                Util.formatToIdr(e.uangMasuk!),
                                            tunggakan:
                                                Util.formatToIdr(e.tunggakan!),
                                            persentaseSelesai:
                                                e.presentaseUangMasuk!,
                                            tahunAjaran: e.tahunAjaran!,
                                          ))
                                      .toList());
                            } else if (state is DetailUktSemesterLoading) {
                              return Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              );
                            } else if (state is DetailUktSemesterFailed) {
                              return Center(
                                child: Text(state.msg, style: redTextStyle),
                              );
                            }
                            return const SizedBox();
                          },
                        )
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
