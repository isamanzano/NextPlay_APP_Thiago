import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/cadastro.dart';
import 'package:projetostreaming/shared/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
     
   
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.gradient1, MyColors.gradient2
            ],
            stops: [0.0, 0.8], // Posições das cores no degradê
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        ),
      );
  }
  
  }
