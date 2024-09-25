import 'package:flutter/material.dart'; 
import 'package:projetostreaming/pages/login.dart'; 
import 'package:projetostreaming/shared/style.dart'; 

void main() {
  runApp(Splash()); // Inicia o aplicativo com a tela de Splash.
}

// Classe principal para a tela de Splash.
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(), // Define LoadingScreen como a tela inicial do aplicativo.
    );
  }
}

// Classe para a tela de Loading (carregamento).
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState(); // Cria o estado para esta tela.
}

// Classe que gerencia o estado da tela de Loading.
class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controlador da animação.
  late Animation<Offset> _slideAnimation; // Animação de deslizamento.
  bool _showIndicator = false; // Controla a exibição do CircularProgressIndicator.

  @override
  void initState() {
    super.initState(); // Chama o método initState da superclasse.

    // Inicializa o controlador da animação com uma duração de 2 segundos.
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // O vsync é usado para otimizar a animação.
    );

    // Define a animação de deslizamento.
    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Começa fora da tela (embaixo).
      end: Offset(0.0, 0.0),   // Termina na posição normal (visível).
    ).animate(CurvedAnimation(
      parent: _controller, // Associa a animação ao controlador.
      curve: Curves.easeInOut, // Define uma curva suave para a animação.
    ));

    // Inicia a animação e define o que acontece quando ela termina.
    _controller.forward().then((_) {
      // Após a animação de deslizamento, ativa o CircularProgressIndicator.
      setState(() {
        _showIndicator = true; // Atualiza o estado para mostrar o indicador.
      });

      // Aguarda 3 segundos antes de mudar para a tela de Login.
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()), // Navega para a tela de Login.
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera os recursos do controlador quando a tela é descartada.
    super.dispose(); // Chama o método dispose da superclasse.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold fornece a estrutura básica da tela.
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyColors.gradient1, MyColors.gradient2
            ],
            stops: [0.0, 0.8], // Posições das cores no degradê
            begin: Alignment.topCenter,
            end: Alignment.bottomRight, // Fim do gradiente.
          ),
        ),
        child: Center( // Centraliza os widgets dentro do container.
          child: SlideTransition( // Aplica a animação de deslizamento.
            position: _slideAnimation, // A animação que controla a posição.
            child: Column( // Alinha os filhos verticalmente.
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente.
              children: [
                Image.asset("assets/logo.png"), // Exibe a logo a partir dos assets.
                SizedBox(height: 20), // Espaçamento vertical.
                if (_showIndicator) // Mostra o indicador somente se _showIndicator for verdadeiro.
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Cor do indicador.
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
