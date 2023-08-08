import 'package:aplikasi_pembayaran_ukt/ui/widget/custom_form_field.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nb_utils/nb_utils.dart';

import '../../../core/theme.dart';
import '../../widget/back_icon_button.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  // Initial Selected Value
  String dropdownvalue = 'Pilih Semester';

  final TextEditingController _nominalController =
      TextEditingController(text: "Rp 0");
  final formatCurrency =
      intl.NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);

  // List of items in our dropdown menu
  var items = [
    'Pilih Semester',
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];

  bool _isPayAllChecked = false;

  @override
  Widget build(BuildContext context) {
    Widget payAllCheckbox() {
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

                  if(_isPayAllChecked){
                    String value = "Rp 7.000.000";
                    _nominalController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: value.length),
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

    Widget dropdown() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        width: double.infinity,
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
          focusColor: kPrimaryColor,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pilih Semester", style: blackTextStyle),
            const SizedBox(height: 6),
            dropdown(),
            const SizedBox(height: 20),
            dropdownvalue != "Pilih Semester"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kewajiban Bayar"),
                      const SizedBox(height: 4),
                      FittedBox(
                          child: Text("Rp 7.000.000",
                              style: redTextStyle.copyWith(
                                  fontSize: 25, fontWeight: semiBold))),
                      const SizedBox(height: 20),
                      CustomFormField(
                        isRequired: true,
                        fieldName: "Nominal Bayar",
                        textInputType: TextInputType.number,
                        controller: _nominalController,
                        onChanged: (value) {
                          var cleanedValue =
                              value.replaceAll("Rp ", "").replaceAll(".", "");

                          var formattedCurrency =
                              formatCurrency.format(cleanedValue.toInt());
                          _nominalController.value = TextEditingValue(
                            text: formattedCurrency,
                            selection: TextSelection.fromPosition(
                              TextPosition(offset: formattedCurrency.length),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      payAllCheckbox(),
                      const SizedBox(height: 20),
                      GenericButton(buttonTitle: "Bayar", onPressed: () {
                        print(_nominalController.text.replaceAll("Rp ", "").replaceAll(".", "").toInt());
                      })
                    ],
                  )
                : const SizedBox(),
          ],
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
