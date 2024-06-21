import 'package:flutter/material.dart';
import 'package:projeto_epi/Provider/admin/cadepi.dart';
import 'package:projeto_epi/utils/mensage.dart';
import 'package:projeto_epi/widget/botao.dart';
import 'package:projeto_epi/widget/field.dart';
import 'package:provider/provider.dart';

class AdminEpi extends StatefulWidget {
  const AdminEpi({super.key});

  @override
  State<AdminEpi> createState() => _AdminEpiState();
}

class _AdminEpiState extends State<AdminEpi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _instrucoes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CadEpiProvider>(builder: (context, epiProvider, _) {
      return Form(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Administrativo'),
            ),
            body: Center(
              child: Column(
                children: [
                  customTextField(
                      title: 'Nome do Epi',
                      controller: _nome,
                      hint: 'Digite o nome do Epi',
                      tipo: TextInputType.text),
                  customTextField(
                      title: 'Instruções de uso',
                      controller: _instrucoes,
                      hint: 'Digite as intruções de uso do Epi',
                      tipo: TextInputType.text),
                  customButton(
                      tap: () {
                        if (_formKey.currentState!.validate()) {
                          epiProvider.cadastrar(
                              context, _nome.text, _instrucoes.text);
                        } else {
                          showMessage(
                              message: "Todos os campos devem ser preenchidos");
                        }
                      },
                      text: "Concluir",
                      context: context,
                      status: epiProvider.carregando)
                ],
              ),
            )),
      );
    });
  }
}
