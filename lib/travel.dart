import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travel Expressions',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/backround.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            _buildTab('English', '🇺🇸', _englishTravelPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishTravelPatterns()),
            _buildTab('Italian', '🇮🇹', _italianTravelPatterns()),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/backround.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildPatternList(_englishTravelPatterns()),
            _buildPatternList(_spanishTravelPatterns()),
            _buildPatternList(_italianTravelPatterns()),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/backround.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              activeIcon: Icon(Icons.home, color: Colors.white),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Colors.white),
              activeIcon: Icon(Icons.message, color: Colors.white),
              label: 'ChatBox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library, color: Colors.white),
              activeIcon: Icon(Icons.video_library, color: Colors.white),
              label: 'Videos',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          onTap: (int index) {
            // Bottom navigation bar elemanlarına tıklandığında yapılacak işlemleri ekleyin
            switch (index) {
              case 0:
              // Learn sekmesine gidin
                break;
              case 1:
              // Practice sekmesine gidin
                break;
              case 2:
              // Notifications sekmesine gidin
                break;
              case 3:
              // Chat sekmesine gidin
                break;
              case 4:
              // Settings sekmesine gidin
                break;
            }
          },
        ),
      ),
    );
  }

  Tab _buildTab(String language, String flagEmoji, List<String> patterns) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                language,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 5),
              Text(
                flagEmoji,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _englishTravelPatterns() {
    return [
      'Hello',
      'How can I help you?',
      'Can you recommend a good restaurant?',
      'What time is the next train/bus?',
      'How much is a ticket to...?',
      'Where is the nearest hotel?',
      'I need a map of the city.',
      'Excuse me, where is the bathroom?',
      'Can you take a photo for us, please?',
      'Thank you for your help!',
    ];
  }

  List<String> _spanishTravelPatterns() {
    return [
      'Hola',
      '¿Cómo puedo ayudarte?',
      '¿Puedes recomendarme un buen restaurante?',
      '¿A qué hora es el próximo tren/autobús?',
      '¿Cuánto cuesta un boleto para...?',
      '¿Dónde está el hotel más cercano?',
      'Necesito un mapa de la ciudad.',
      'Perdón, ¿dónde está el baño?',
      '¿Puedes tomarnos una foto, por favor?',
      '¡Gracias por tu ayuda!',
    ];
  }

  List<String> _italianTravelPatterns() {
    return [
      'Ciao',
      'Come posso aiutarti?',
      'Puoi consigliarmi un buon ristorante?',
      'A che ora è il prossimo treno/autobus?',
      'Quanto costa un biglietto per...?',
      'Dove si trova l\'hotel più vicino?',
      'Ho bisogno di una mappa della città.',
      'Scusa, dov\'è il bagno?',
      'Puoi farci una foto, per favore?',
      'Grazie per il tuo aiuto!',
    ];
  }

  Widget _buildPatternList(List<String> patterns) {
    return ListView.builder(
      itemCount: patterns.length,
      itemBuilder: (context, index) {
        return _buildPatternItem(patterns[index]);
      },
    );
  }

  Widget _buildPatternItem(String pattern) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListTile(
        title: Text(
          pattern,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        onTap: () {},
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TravelPage(),
  ));
}
