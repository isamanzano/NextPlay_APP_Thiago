import 'package:flutter/material.dart';
import 'package:projetostreaming/pages/cadastro.dart';
import 'package:projetostreaming/shared/style.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _selectedValue;
  bool _isDropdownOpened = false;

  //URL
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpened = !_isDropdownOpened;
    });
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),

      //DROPDOWN
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Conta'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Categorias'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //NAVBAR
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: Colors.white),
            label: 'Pesquisa',
          ),
          NavigationDestination(
            icon: Icon(Icons.history, color: Colors.white),
            label: 'Histórico',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, color: Colors.white),
            label: 'Você',
          ),
        ],
      ),

      // CARD ESTILO YOUTUBE
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          buildYouTubeCard(
            context,
            'TSUNAMI AUTOMÁTICO - Minecraft Em busca da casa automática #308',
            'assets/tsunamiautomatico.jpg',
            'Viniccius13',
            '3,7 mi de visualizações',
          ),
          buildYouTubeCard(
            context,
            'VALORANT AO VIVO! - O NOVO JOGO DO MOMENTO?',
            'assets/valorantaovivo.jpg',
            'Ei Games',
            '15 mil de visualizações',
          ),
          buildYouTubeCard(
            context,
            'MANCHESTER CITY X REAL MADRID TRANSMISSÃO AO VIVO DIRETO DO ETIHAD STADIUM - CHAMPIONS LEAGUE 2023',
            'assets/realmadrid.jpg',
            'Litoral News',
            '1 mi de visualizações',
          ),
          buildYouTubeCard(
            context,
            'Farm de Madeira 100% Automática - Minecraft Em busca da casa automática #342',
            'assets/farmdemadeira.jpg',
            'Viniccius13',
            '3,8 mi de visualizações',
          ),
        ],
      ),
    );
  }

  // CONTINUAÇÃO CARD ESTILO YOUTUBE
  Widget buildYouTubeCard(BuildContext context, String title, String imageUrl,
      String channelName, String videoInfo) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ink.image(
            image: NetworkImage(imageUrl),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                 _launchUrl('youtu.be/dhcdtJxEVVY?si=RLk6g3vNQEbEhcbz');
                 },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'assets/viniccius13.jpg'), 
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$channelName • $videoInfo',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
