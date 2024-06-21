import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_epi/Provider/cadastro/verifica_usuario.dart';
import 'package:projeto_epi/pages/confirm_password.dart';
import 'package:projeto_epi/utils/mensage.dart';
import 'package:projeto_epi/widget/botao.dart';
import 'package:projeto_epi/widget/field.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se'),
      ),
      body: const SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override
  void dispose() {
    _cpfController.clear();
    _emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioCadastrado>(builder: (context, usuario, _) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextField(
                  title: 'Email',
                  controller: _emailController,
                  hint: 'Digite seu e-mail',
                  tipo: TextInputType.emailAddress),
              const SizedBox(
                height: 10,
              ),
              customTextField(
                  title: 'CPF',
                  controller: _cpfController,
                  hint: 'Digite seu CPF',
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ]),
              // TextFormField(
              //   controller: _emailController,
              //   decoration: const InputDecoration(
              //       labelText: 'E-mail',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //         borderSide: BorderSide(color: Colors.black, width: 2.0),
              //       )),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextFormField(
              //   controller: _cpfController,
              //   decoration: const InputDecoration(
              //       labelText: 'CPF',
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //         borderSide: BorderSide(color: Colors.black, width: 2.0),
              //       )),
              // ),
              const SizedBox(
                height: 20,
              ),
              customButton(
                  tap: () async {
                    await usuario.checarUsuario(
                        _cpfController.text, _emailController.text);
                    if (usuario.valido) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmPassword(
                                    email: _emailController.text,
                                    cpf: _cpfController.text,
                                  )));
                    } else {
                      showMessage(message: usuario.msgError, context: context);
                    }
                  },
                  text: 'Avançar',
                  context: context,
                  status: usuario.carregando)
            ],
          ),
        ),
      );
    });
  }
}
