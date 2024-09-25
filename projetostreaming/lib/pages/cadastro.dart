import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/login.dart';
import 'package:projetostreaming/pages/home.dart';
import 'package:projetostreaming/shared/style.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height*1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.gradient1, MyColors.gradient2]
            ),
          ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(210, 129, 179, 209)

            ),
          child: Form(
            key: _formKey, // Assign the key to the Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Informe seu Nome",
                  ),
                  validator: (String? name) {
                    if (name == "" || name == null) {
                      return "Este campo não pode estar vazio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.file_copy),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Informe seu CPF",
                  ),
                  validator: (String? cpf) {
                    if (cpf == "" || cpf == null) {
                      return "Este campo não pode estar vazio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Informe seu Celular",
                  ),
                  validator: (String? number) {
                    if (number == "" || number == null) {
                      return "Este campo não pode estar vazio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Informe seu Email",
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
                SizedBox(height: 15),
                TextFormField(
                  autofocus: true,
                  obscureText: _showPassword == false ? true : false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility,), //if e else
                    onTap:() {
                      setState(() {
                        _showPassword = !_showPassword;
                      });

                    },
                    ),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Informe sua Senha",
                  ),
                  validator: (String? password) {
                    if (password == "" || password == null) {
                      return "A senha não pode estar vazia";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  autofocus: true,
                  obscureText: _showPassword2 == false ? true : false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_open),
                    suffixIcon: GestureDetector(child: Icon(_showPassword2 == false ? Icons.visibility_off : Icons.visibility,), //if e else
                    onTap:() {
                      setState(() {
                        _showPassword2 = !_showPassword2;
                      });

                    },
                    ),
                    iconColor: Color.fromARGB(255, 26, 121, 165),
                    hintText: "Confirme sua Senha",
                  ),
                  validator: (String? password) {
                    if (password == "" || password == null) {
                      return "A senha não pode estar vazia";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Center(
                  child: ElevatedButton(
                    onPressed: buttonEnterClick,
                    child: Text("Me Cadastrar"),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(200, 50),
                      backgroundColor: Color.fromARGB(255, 26, 121, 165),
                      foregroundColor: Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: const Text(
                    "Fazer Cadastro",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const Text("Já possui login? Clique no link acima")
              ],
            ),
          ),
        ),
        ),
      ),
      );
  }

  void buttonEnterClick() {
    if (_formKey.currentState!.validate()) {
      print("forms ok");
    } else {
      print("forms error");
    }
  }
}
