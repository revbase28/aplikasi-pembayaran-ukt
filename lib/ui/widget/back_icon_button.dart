import 'package:aplikasi_pembayaran_ukt/core/theme.dart';
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {

  final Color color;

  const BackIconButton({Key? key, this.color = const Color(0xFFFFFFFF)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: color,
        ));
  }
}
