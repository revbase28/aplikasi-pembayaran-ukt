import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final EdgeInsets margin;
  final bool isRequired;
  final String fieldName;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool useToogleVisibility;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomFormField(
      {Key? key,
      this.margin = const EdgeInsets.only(bottom: 16),
      required this.isRequired,
      required this.fieldName,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.hintText = "",
      this.useToogleVisibility = false,
      this.validator,
      this.onChanged})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _textVisible = false;
  double _borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    Widget formFieldLabel() {
      if (widget.isRequired) {
        return Text.rich(
            TextSpan(text: widget.fieldName, style: blackTextStyle, children: [
          TextSpan(
            text: " *",
            style: redTextStyle,
          )
        ]));
      }

      return Text(widget.fieldName, style: blackTextStyle);
    }

    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          formFieldLabel(),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: widget.textInputType,
            obscureText: widget.useToogleVisibility && !_textVisible,
            cursorColor: kGreenColor,
            controller: widget.controller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kInactiveColor),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kRedColor),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                hintText: widget.hintText,
                hintStyle: greyTextStyle.copyWith(fontSize: 16),
                errorStyle: redTextStyle.copyWith(fontSize: 16),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                suffixIcon: widget.useToogleVisibility
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _textVisible = !_textVisible;
                          });
                        },
                        icon: Icon(
                          _textVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kBlackColor,
                        ))
                    : null),
            validator: (String? value) {
              if ((value == null || value.isEmpty) && widget.isRequired) {
                print("Called");
                return 'Please enter some text';
              }

              print("Called here");
              if (widget.validator != null) {
                print("Called validator");
                return widget.validator!(value);
              }

              return null;
            },
            onChanged: (value) {
              if(widget.onChanged != null){
                widget.onChanged!(value);
              }
            }
          )
        ],
      ),
    );
  }
}
