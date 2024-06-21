import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_epi/style/colors.dart';

Widget customTextField(
    {String? title,
    String? hint,
    TextEditingController? controller,
    int? maxLines = 1,
    bool? obscure = false,
    TextInputType? tipo = TextInputType.text,
    void Function(String)? funcao,
    List<TextInputFormatter>? formatacao}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, color: grey),
        ),
      ),
      TextFormField(
        keyboardType: tipo,
        obscureText: obscure!,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            )),
        onChanged: funcao,
        inputFormatters: formatacao,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '* Preencha o campo';
          }
          return null;
        },
      ),
    ],
  );
}
