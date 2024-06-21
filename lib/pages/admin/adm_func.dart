import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_epi/Provider/admin/colaborador.dart';
import 'package:projeto_epi/utils/mensage.dart';
import 'package:projeto_epi/widget/botao.dart';
import 'package:projeto_epi/widget/field.dart';
import 'package:provider/provider.dart';

class AdmFunc extends StatefulWidget {
  const AdmFunc({super.key});

  @override
  State<AdmFunc> createState() => _AdmFuncState();
}

class _AdmFuncState extends State<AdmFunc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _ctps = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataAdmissao = TextEditingController();

  @override
  void dispose() {
    _nome.clear();
    _ctps.clear();
    _telefone.clear();
    _cpf.clear();
    _email.clear();
    _dataAdmissao.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColabProvider>(builder: (context, colabProvider, _) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Administrativo'),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    customTextField(
                        title: 'Nome do Funcionario',
                        controller: _nome,
                        hint: 'Digite o nome do Funcionario',
                        tipo: TextInputType.text),
                    customTextField(
                        title: 'Numero CTPS',
                        controller: _ctps,
                        hint: 'Digite o numero da CTPS',
                        tipo: TextInputType.text),
                    customTextField(
                        title: 'Telefone',
                        controller: _telefone,
                        hint: 'Digite o numero de telefone',
                        tipo: TextInputType.number),
                    customTextField(
                        title: 'Cpf',
                        controller: _cpf,
                        hint: 'Digite o CPF do funcionario',
                        tipo: TextInputType.text,
                        formatacao: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter()
                        ]),
                    customTextField(
                        title: 'Email',
                        controller: _email,
                        hint: 'Digite o email do colaborador',
                        tipo: TextInputType.emailAddress),
                    customTextField(
                        title: 'Data de adimissao',
                        controller: _dataAdmissao,
                        hint: 'Digite a data de contratação',
                        tipo: TextInputType.datetime,
                        formatacao: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ]),
                    customButton(
                        tap: () {
                          if (_formKey.currentState!.validate()) {
                            colabProvider.cadastrar(
                              context,
                              _nome.text,
                              _ctps.text,
                              _telefone.text,
                              _cpf.text,
                              _email.text,
                              _dataAdmissao.text,
                            );
                          } else {
                            showMessage(
                                message:
                                    "Todos os campos devem ser preenchidos",
                                context: context);
                          }
                        },
                        text: "Concluir",
                        context: context,
                        status: colabProvider.carregando)
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
