import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/cadastro.dart';

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
      backgroundColor: Color.fromARGB(255, 12, 85, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 121, 165),
        title: Text("Tela de Home"),),
        floatingActionButton: FloatingActionButton(onPressed: (){}, 
        child: Icon(Icons.add),),
      body: Center(
        child: Container(
        child:Form(
          key: _formKey,
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //horizontal
              mainAxisAlignment: MainAxisAlignment.start, //vertical
            ),
          ),
        ),
        ),
      ),
    );
  }
  buttonEnterClick(){
    if(_formKey.currentState!.validate()){
      print("forms ok");
    }
      else{
        print("forms error");
      }
  }
}