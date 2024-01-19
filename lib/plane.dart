import 'package:flutter/material.dart';

class PlanePage extends StatefulWidget {
  const PlanePage({Key? key}) : super(key: key);

  @override
  _PlanePageState createState() => _PlanePageState();
}

class _PlanePageState extends State<PlanePage> with SingleTickerProviderStateMixin {
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
          'Plane Expressions',
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
            _buildTab('English', '🇺🇸', _englishPlanePatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishPlanePatterns()),
            _buildTab('Italian', '🇮🇹', _italianPlanePatterns()),
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
            _buildPatternList(_englishPlanePatterns()),
            _buildPatternList(_spanishPlanePatterns()),
            _buildPatternList(_italianPlanePatterns()),
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

  List<String> _englishPlanePatterns() {
    return [
      'I would like to check in for my flight.',
      'What time does my flight depart?',
      'Where is the departure gate?',
      'Can I have an aisle/window seat?',
      'How much baggage am I allowed to take?',
      'Is there a meal service on this flight?',
      'What is the flight duration to...?',
      'Where can I collect my baggage?',
      'How do I get to the airport from here?',
      'Thank you for your assistance!',
    ];
  }

  List<String> _spanishPlanePatterns() {
    return [
      'Me gustaría hacer el check-in para mi vuelo.',
      '¿A qué hora sale mi vuelo?',
      '¿Dónde está la puerta de salida?',
      '¿Puedo tener un asiento de pasillo/ventanilla?',
      '¿Cuánto equipaje puedo llevar?',
      '¿Hay servicio de comida en este vuelo?',
      '¿Cuál es la duración del vuelo a...?',
      '¿Dónde puedo recoger mi equipaje?',
      '¿Cómo llego al aeropuerto desde aquí?',
      '¡Gracias por tu ayuda!',
    ];
  }

  List<String> _italianPlanePatterns() {
    return [
      'Vorrei fare il check-in per il mio volo.',
      'A che ora parte il mio volo?',
      'Dove si trova il gate di partenza?',
      'Posso avere un posto vicino al corridoio/finestra?',
      'Quanto bagaglio posso portare?',
      'C\'è un servizio di pasti su questo volo?',
      'Qual è la durata del volo per...?',
      'Dove posso ritirare il mio bagaglio?',
      'Come arrivo all\'aeroporto da qui?',
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
  runApp(MaterialApp(
    home: PlanePage(),
  ));
}
