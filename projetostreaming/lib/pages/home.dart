import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/cadastro.dart';
import 'package:projetostreaming/shared/style.dart';

class HomeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext){
    return MaterialApp(
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 163, 213, 247),
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Pesquisa',
          ),
          NavigationDestination(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Você',
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        

        ),
      );
  }
  
  }
