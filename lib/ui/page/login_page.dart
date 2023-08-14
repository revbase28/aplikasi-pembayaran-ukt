import 'package:aplikasi_pembayaran_ukt/core/const.dart';
import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:aplikasi_pembayaran_ukt/cubit/auth_cubit.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/tools/shared_pref_util.dart';
import '../widget/generic_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameNimController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("Token : ${SharedPrefUtil.getToken()}");
      if (SharedPrefUtil.getToken() != "") {
        if (SharedPrefUtil.getRole() == 'Petugas') {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConsants.petugasDashboardRoute, (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConsants.mahasiswaDashboardRoute, (route) => false);
        }
      }
    });
    super.initState();
  }

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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    if (state.response.role == 'Petugas') {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteConsants.petugasDashboardRoute,
                          (route) => false);
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteConsants.mahasiswaDashboardRoute,
                          (route) => false);
                    }
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: kRedColor, content: Text(state.msg)));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    );
                  }
                  return GenericButton(
                      buttonTitle: "Masuk",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                              _unameNimController.text,
                              _passwordController.text);
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
