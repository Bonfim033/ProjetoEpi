import 'package:flutter/material.dart';
import 'package:projeto_epi/style/colors.dart';

Widget customButton({
  VoidCallback? tap,
  bool? status = false,
  String? text,
  BuildContext? context,
}) {
  return SizedBox(
    width: MediaQuery.of(context!).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: status == false ? tap : null,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.all(16),
        ),
        child: Text(
          status == false ? text! : 'Aguarde...',
          style: TextStyle(
            fontSize: 20,
            color: white,
          ),
        ),
      ),
    ),
  );
}
