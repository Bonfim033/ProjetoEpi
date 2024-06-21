import 'package:flutter/material.dart';
import 'package:projeto_epi/style/colors.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
    content: Text(
      message!,
      style: TextStyle(color: lightgrey),
  ),
  backgroundColor: primaryColor,));
}
