import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/bayar_tagihan_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/bayar_tagihan_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/custom_form_field.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nb_utils/nb_utils.dart';

import '../../../core/theme.dart';
import '../../../core/tools/util.dart';
import '../../../cubit/check_tagihan_cubit.dart';
import '../../widget/back_icon_button.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final TextEditingController _nominalController =
      TextEditingController(text: "Rp 0");

  bool _isPayAllChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CheckTagihanCubit>().checkTagihan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget payAllCheckbox(int tagihan) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
                value: _isPayAllChecked,
                checkColor: kWhiteColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                fillColor:
                    MaterialStateColor.resolveWith((states) => kPrimaryColor),
                onChanged: (value) {
                  setState(() {
                    _isPayAllChecked = value ?? false;
                  });

                  if (_isPayAllChecked) {
                    String stringTagihan = Util.formatToIdr(tagihan);
                    _nominalController.value = TextEditingValue(
                      text: stringTagihan,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: stringTagihan.length),
                      ),
                    );
                  }
                }),
          ),
          const SizedBox(width: 8),
          Text("Bayar seluruh kewajiban",
              style: blackTextStyle.copyWith(fontSize: 12))
        ],
      );
    }

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
        child: BlocBuilder<CheckTagihanCubit, CheckTagihanState>(
          builder: (context, checkTagihanState) {
            if (checkTagihanState is CheckTagihanSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Semester ${checkTagihanState.response.semester!}",
                      style: blackTextStyle.copyWith(
                          fontSize: 25, fontWeight: semiBold)),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kewajiban Bayar"),
                      const SizedBox(height: 4),
                      FittedBox(
                          child: Text(
                              Util.formatToIdr(
                                  checkTagihanState.response.tagihan!),
                              style: redTextStyle.copyWith(
                                  fontSize: 25, fontWeight: semiBold))),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: CustomFormField(
                          isRequired: true,
                          fieldName: "Nominal Bayar",
                          textInputType: TextInputType.number,
                          controller: _nominalController,
                          onChanged: (value) {
                            var cleanedValue =
                                value.replaceAll("Rp ", "").replaceAll(".", "");

                            var formattedCurrency =
                                Util.formatToIdr(cleanedValue.toInt());
                            _nominalController.value = TextEditingValue(
                              text: formattedCurrency,
                              selection: TextSelection.fromPosition(
                                TextPosition(offset: formattedCurrency.length),
                              ),
                            );
                          },
                          validator: (value) {
                            var intValue = value
                                ?.replaceAll("Rp ", "")
                                .replaceAll(".", "")
                                .toInt(defaultValue: 0);

                            if (intValue == 0) {
                              return "Masukan nominal bayar";
                            }

                            if (intValue! >
                                checkTagihanState.response.tagihan!) {
                              return "Nominal terlalu besar";
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      payAllCheckbox(checkTagihanState.response.tagihan!),
                      const SizedBox(height: 20),
                      BlocConsumer<BayarTagihanCubit, BayarTagihanState>(
                        listener: (context, state) {
                          if (state is BayarTagihanSuccess) {
                            Navigator.pushNamed(context, RouteConsants.payment,
                                arguments: state.response.snapToken!);
                          } else if (state is BayarTagihanFailed) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: kRedColor,
                                content: Text(state.msg)));
                          }
                        },
                        builder: (context, state) {
                          if (state is BayarTagihanLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor),
                            );
                          }

                          return GenericButton(
                              buttonTitle: "Bayar",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<BayarTagihanCubit>()
                                      .bayarTagihan(
                                          checkTagihanState.response.semester!,
                                          _nominalController.text
                                              .replaceAll("Rp ", "")
                                              .replaceAll(".", "")
                                              .toInt());
                                }
                              });
                        },
                      )
                    ],
                  ),
                ],
              );
            }

            if (checkTagihanState is CheckTagihanLoading) {
              return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor));
            }

            if (checkTagihanState is CheckTagihanFailed) {
              return Center(
                  child: Text(checkTagihanState.msg, style: redTextStyle));
            }

            return const SizedBox();
          },
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
                Text("Pembayaran UKT",
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
