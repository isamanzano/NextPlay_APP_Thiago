import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/cadastro.dart';
import 'package:projetostreaming/pages/home.dart';
import 'package:projetostreaming/pages/login.dart';
import 'package:projetostreaming/shared/style.dart';

class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;


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
        child: Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem fora do Container do formulário
          Image.asset(
            'assets/logo.png', // Substitua pelo caminho da sua imagem
            height: 150, // Altura da imagem
            fit: BoxFit.contain, // Ajuste o conteúdo da imagem
          ),
          SizedBox(height: 20), // Espaçamento entre a imagem e o formulário

          // Container que contém o formulário
          Center(
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(106, 255, 255, 255),
                borderRadius: BorderRadius.circular(8.0), // Adiciona bordas arredondadas
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Campos do formulário aqui
                      SizedBox(height: 20), // Espaçamento entre os campos do formulário
                   
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Informe o E-mail",
                            labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca
                              ),
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca quando habilitado
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca quando em foco
                              ),
                   
                    ),
                   validator: (String? email) {
                      if (email == "" || email == null) {
                        return "O email não pode ser vazio";
                      }
                      if (email.length < 6) {
                        return "O email está muito curto";
                      }
                      if (!email.contains("@")) {
                        return "O email é inválido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _showPassword == false ? true : false,
                    autofocus: true,
            
            
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(child: Icon(
                      color: Colors.white,
                      _showPassword == false ? Icons.visibility_off : Icons.visibility,
                      ),
                     
                      onTap:(){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
            
            
                      }),
                      labelText: "Informe a Senha",
                      labelStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca
                              ),
                              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca quando habilitado
                              ),
                              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 2), // Borda branca quando em foco
                              ),
                   
                    ),
                   validator: (String? password) {
                      if (password == "" || password == null) {
                        return "A senha não pode estar vazia";
                      }
                      return null;
                    },
                  ),
                 
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){buttonEnterClick();}, child: Text("Entrar"),
                    style: ElevatedButton.styleFrom(
                     
                      fixedSize: Size(200, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                     
                    ),
                    ),
                  ),
                  SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                          },
                      child: Center( // Centraliza o texto
                        child: const Text(
                          "Já tem uma conta? Faça Cadastro",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                          textAlign: TextAlign.center, // Centraliza o texto dentro do widget
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  // Ícone do Google
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/google_icon.png'),
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      
                    ),
                  ),
                  SizedBox(width: 20),
                  // Ícone do Instagram
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/instagram_icon.png'),
                      backgroundColor: Colors.transparent,
                      radius: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                  // Ícone do Facebook
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/facebook_icon.png'),
                      backgroundColor: Colors.transparent,
                      radius: 20,
                    ),
                  ),
                ],
              ),
              ],
              ),
            ),
            ),
          ),
          ),
        ],
      ),
    ),
    ),  
    ),
    );
  }




  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      // Navega para a tela Home usando pushReplacement
    } else {
      print("Erro na validação do formulário");
    }
  }
}

