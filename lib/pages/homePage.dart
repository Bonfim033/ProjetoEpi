import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_epi/Provider/login/logar.dart';
import 'package:projeto_epi/utils/mensage.dart';
import 'package:projeto_epi/widget/botao.dart';
import 'package:projeto_epi/widget/field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<logar>(builder: (context, logar, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('SafeGuard'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              children: [
                customTextField(
                    title: 'Email',
                    controller: _email,
                    hint: 'Digite seu e-mail',
                    tipo: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                    title: 'Senha',
                    controller: _password,
                    hint: 'Digite sua senha',
                    obscure: true,
                    tipo: TextInputType.visiblePassword,
                    funcao: (value) {
                      logar.validatePassword(value);
                    }),
                if (logar.msgError.isNotEmpty)
                  Text(
                    logar.msgError,
                    style: const TextStyle(color: Colors.red),
                  ),
                const SizedBox(
                  height: 30,
                ),
                customButton(
                    text: 'Login',
                    tap: () async {
                      if (_email.text.isEmpty || _password.text.isEmpty) {
                        showMessage(
                            message: 'Todos os campos são requiridos',
                            context: context);
                      } else {
                        await logar.logarUsuario(
                            _email.text, _password.text, 0);
                        if (logar.logado) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushNamed(logar.rota);
                        } else {
                          showMessage(
                              message: 'Usuario ou senha invalido',
                              context: context);
                        }
                      }
                    },
                    context: context,
                    status: logar.carregando),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cadastro');
                  },
                  child: const Text('Cadastre-se Agora'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
