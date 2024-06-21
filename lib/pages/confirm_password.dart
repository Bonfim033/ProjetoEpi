import 'package:flutter/material.dart';
import 'package:projeto_epi/Provider/cadastro/valida_login.dart';
import 'package:projeto_epi/utils/mensage.dart';
import 'package:projeto_epi/widget/botao.dart';
import 'package:provider/provider.dart';

class ConfirmPassword extends StatelessWidget {
  final String email;
  final String cpf;

  const ConfirmPassword({super.key, required this.email, required this.cpf});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Consumer<ValidarSenha>(builder: (context, validasenha, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Confirme a senha'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('E-mail: $email'),
                Text('CPF: $cpf'),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      labelText: 'confirmar Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      )),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                customButton(
                    tap: () async {
                      if (passwordController.text !=
                          confirmPasswordController) {
                        showMessage(
                            message: 'As senhas devem ser iguais',
                            context: context);
                      } else {
                        var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
                        await validasenha.createUser(
                            email, passwordController.text, int.parse(cpfint));
                        showMessage(
                            message: validasenha.msgErrorApi, context: context);
                      }
                    },
                    text: 'Concluir',
                    context: context,
                    status: validasenha.carregando),
              ],
            ),
          ),
        ),
      );
    });
  }
}
