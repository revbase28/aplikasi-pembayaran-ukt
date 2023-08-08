import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/custom_form_field.dart';
import 'package:flutter/material.dart';

import '../widget/generic_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _unameNimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

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
                fieldName: "NIM/Username",
                controller: _unameNimController,
              ),
              CustomFormField(
                  isRequired: true,
                  fieldName: "Password",
                  controller: _passwordController,
                  useToogleVisibility: true),
              GenericButton(
                  buttonTitle: "Masuk",
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, RouteConsants.mahasiswaDashboardRoute);
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
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            children: [
              Text("Silahkan Masuk Untuk Melanjutkan",
                  style:
                      blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24)),
              const SizedBox(height: 30),
              inputSection()
            ],
          ),
    ));
  }
}
