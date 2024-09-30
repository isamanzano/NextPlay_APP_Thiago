import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/home.dart';
import 'package:projetostreaming/pages/login.dart';
import 'package:projetostreaming/pages/cadastro.dart';
import 'package:projetostreaming/pages/splash.dart';
import 'package:projetostreaming/shared/style.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, //definidr tema claro ou escuro
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.azulEscuro),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
     routes: {
      '/splash' : (context) => SplashScreen(),
      '/login' : (context) =>  Login(),
      '/cadastro' : (context) => const Cadastro(),
      '/home' : (context) => const Home(),
     },
    ); 
  }
}

