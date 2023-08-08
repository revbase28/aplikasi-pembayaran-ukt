import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/core/tools/debouncer.dart';
import 'package:aplikasi_pembayaran_ukt/core/tools/random_string_gen.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/back_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../../widget/custom_form_field.dart';
import '../../widget/generic_button.dart';

class TambahAkunMahasiswaPage extends StatefulWidget {
  TambahAkunMahasiswaPage({Key? key}) : super(key: key);

  @override
  State<TambahAkunMahasiswaPage> createState() =>
      _TambahAkunMahasiswaPageState();
}

class _TambahAkunMahasiswaPageState extends State<TambahAkunMahasiswaPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nimController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _showMhsData = false;

  final Debouncer _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    Widget inputSection() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer)
            ]),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                isRequired: true,
                fieldName: "NIM",
                controller: _nimController,
                textInputType: TextInputType.number,
                onChanged: (value) {
                  _debouncer.run(() {
                    if (value.isEmpty) {
                      setState(() {
                        _showMhsData = false;
                      });
                    } else {
                      setState(() {
                        _showMhsData = true;
                      });
                    }
                  });
                },
              ),
              _showMhsData
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 16),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Mahasiswa",
                              style: blackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold)),
                          const SizedBox(height: 4),
                          Text("Jurusan Teknik Informatika",
                              style: blackTextStyle),
                          const SizedBox(height: 4),
                          Text("Semester 2", style: blackTextStyle),
                        ],
                      ),
                    )
                  : const SizedBox(),
              CustomFormField(
                  isRequired: true,
                  fieldName: "Password",
                  controller: _passwordController,
                  useToogleVisibility: true),
              GenericButton(
                  buttonTitle: "Generate Password",
                  outlineStyled: true,
                  onPressed: () {
                    var newPassValue = RandomStringGen().getRandomString(8);
                    _passwordController.value = TextEditingValue(
                      text: newPassValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: newPassValue.length),
                      ),
                    );
                  }),
              const SizedBox(height: 12),
              GenericButton(
                  buttonTitle: "Tambah Akun",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: kGreenColor,
                          content: Text("Berhasil Menambah Akun")));

                      _nimController.text = "";
                      _passwordController.text = "";
                      setState(() {
                        _showMhsData = false;
                      });
                    }
                  })
            ],
          ),
        ),
      );
    }

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
                Text("Tambah Akun\nMahasiswa",
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 24)),
                inputSection()
              ],
            ),
          )
        ],
      ),
    ));
  }
}
