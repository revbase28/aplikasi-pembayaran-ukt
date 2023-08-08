import 'package:flutter/material.dart';
import '../../core/theme.dart';

class GenericButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onPressed;
  final double width;
  final double height;
  final Widget Function(String)? child;
  final double fontSize;
  final EdgeInsets padding;
  final double radius;
  final bool outlineStyled;

  const GenericButton(
      {Key? key,
      required this.buttonTitle,
      required this.onPressed,
      this.width = double.infinity,
      this.height = 55,
      this.child,
      this.fontSize = 18,
      this.padding = const EdgeInsets.symmetric(vertical: 14),
      this.radius = 17,
      this.outlineStyled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: outlineStyled
              ? ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  side: BorderSide(color: kPrimaryColor, width: 2.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius)))
              : ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius)),
                  padding: padding,
                  fixedSize: const Size(double.infinity, double.infinity)),
          child: child != null
              ? child!(buttonTitle)
              : Text(buttonTitle,
                  style: (outlineStyled ? purpleTextStyle : whiteTextStyle)
                      .copyWith(fontSize: fontSize, fontWeight: medium))),
    );
  }
}
