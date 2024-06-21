import 'package:flutter/material.dart';
import 'package:projeto_epi/Provider/admin/cadepi.dart';
import 'package:projeto_epi/Provider/admin/colaborador.dart';
import 'package:projeto_epi/Provider/admin/entrega.dart';
import 'package:projeto_epi/Provider/cadastro/valida_login.dart';
import 'package:projeto_epi/Provider/cadastro/verifica_usuario.dart';
import 'package:projeto_epi/Provider/login/logar.dart';
import 'package:projeto_epi/pages/admin/adm_entrega.dart';
import 'package:projeto_epi/pages/admin/adm_epi.dart';
import 'package:projeto_epi/pages/admin/adm_func.dart';
import 'package:projeto_epi/pages/admin/admin.dart';
import 'package:projeto_epi/pages/admin/entrega/dataentrega.dart';
import 'package:projeto_epi/pages/admin/entrega/escolheepi.dart';
import 'package:projeto_epi/pages/dashboard.dart';
import 'package:projeto_epi/pages/homePage.dart';
import 'package:projeto_epi/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ValidarSenha()),
      ChangeNotifierProvider(create: (_) => UsuarioCadastrado()),
      ChangeNotifierProvider(create: (_) => logar()),
      ChangeNotifierProvider(create: (_) => ColabProvider()),
      ChangeNotifierProvider(create: (_) => CadEpiProvider()),
      ChangeNotifierProvider(create: (_) => EntregaProvider()),
    ],
    child: MaterialApp(
    initialRoute: "/",
    routes: {
      '/': (context) => const HomePage(),
      '/cadastro': (context) => const SignupScreen(),
      '/dashboard': (context) => const Dashboard(),
      '/admin': (context) => const Admin(),
      '/admentrega': (context) => const AdmEntrega(),
      '/admepi': (context) => const AdminEpi(),
      '/admfunc': (context) => const AdmFunc(),
      '/episentrega': (context) => const EpisScreen(),
      '/entrega': (context) => EntregaScreen(),
    },
    debugShowCheckedModeBanner: false,
  ),
  ));
}
