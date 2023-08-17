import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/core/tools/debouncer.dart';
import 'package:aplikasi_pembayaran_ukt/core/tools/random_string_gen.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/check_mhs_acc_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/back_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/const.dart';
import '../../../cubit/register_mhs_cubit.dart';
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

  bool isAbleToSubmit = false;

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
                    if (value.isNotEmpty) {
                      context.read<CheckMhsAccCubit>().checkMhsAccStatus(value);
                    } else {
                      context.read<CheckMhsAccCubit>().setStateToIntial();
                    }
                  });
                },
              ),
              BlocConsumer<CheckMhsAccCubit, CheckMhsAccState>(
                listener: (context, state) {
                  if (state is CheckMhsAccSuccess) {
                    if (state.response.status != "DITEMUKAN") {
                      setState(() {
                        isAbleToSubmit = false;
                      });
                    } else {
                      setState(() {
                        isAbleToSubmit = true;
                      });
                    }
                  } else {
                    setState(() {
                      isAbleToSubmit = false;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is CheckMhsAccSuccess) {
                    if (state.response.status! != "DITEMUKAN") {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            state.response.status!,
                            style: redTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                            textAlign: TextAlign.start,
                          ));
                    } else {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.response.data!.nama!,
                                    style: blackTextStyle.copyWith(
                                        fontSize: 18, fontWeight: semiBold)),
                                const SizedBox(height: 4),
                                Text(state.response.data!.jurusan!,
                                    style: blackTextStyle),
                                const SizedBox(height: 4),
                                Text(
                                    state.response.data!.semester!.isDigit()
                                        ? "Semester ${state.response.data!.semester!}"
                                        : state.response.data!.semester!,
                                    style: blackTextStyle),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  }

                  if (state is CheckMhsAccLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    );
                  }

                  if (state is CheckMhsAccFailed) {
                    return Center(
                      child: Text(state.msg, style: redTextStyle),
                    );
                  }

                  return const SizedBox();
                },
              ),
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
              BlocConsumer<RegisterMhsCubit, RegisterMhsState>(
                listener: (context, state) {
                  if (state is RegisterMhsSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kGreenColor,
                        content: const Text("Berhasil Menambah Akun")));

                    _nimController.text = "";
                    _passwordController.text = "";

                    setState(() {
                      isAbleToSubmit = false;
                    });

                    context.read<CheckMhsAccCubit>().setStateToIntial();
                  }

                  if (state is RegisterMhsFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kRedColor, content: Text(state.msg)));
                  }
                },
                builder: (context, state) {
                  if (state is RegisterMhsLoading) {
                    return Center(
                        child: CircularProgressIndicator(color: kPrimaryColor));
                  }

                  return GenericButton(
                      buttonTitle: "Tambah Akun",
                      isEnabled: isAbleToSubmit,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegisterMhsCubit>().registerMhs(
                              _nimController.text, _passwordController.text);
                        }
                      });
                },
              )
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
