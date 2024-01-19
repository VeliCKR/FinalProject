import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> with SingleTickerProviderStateMixin {
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
          'Emergency Expressions',
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
            _buildTab('English', '🇺🇸', _englishEmergencyPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishEmergencyPatterns()),
            _buildTab('Italian', '🇮🇹', _italianEmergencyPatterns()),
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
            _buildPatternList(_englishEmergencyPatterns()),
            _buildPatternList(_spanishEmergencyPatterns()),
            _buildPatternList(_italianEmergencyPatterns()),
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

  List<String> _englishEmergencyPatterns() {
    return [
    'Call the ambulance!',
    'I need immediate help.',
    'Is there a hospital nearby?',
    'Please call the police.',
    'I have been in an accident.',
    'Where is the nearest fire station?',
    'I am having a medical emergency.',
    'Help me, please!',
    'I have lost my way, and I need assistance.',
    'Is there a pharmacy around here?',
    ];
  }

  List<String> _spanishEmergencyPatterns() {
    return [
      '¡Llama a la ambulancia!',
      'Necesito ayuda inmediata.',
      '¿Hay un hospital cerca?',
      'Por favor, llama a la policía.',
      'He tenido un accidente.',
      '¿Dónde está la estación de bomberos más cercana?',
      'Estoy teniendo una emergencia médica.',
      '¡Ayúdame, por favor!',
      'Me he perdido y necesito ayuda.',
      '¿Hay una farmacia por aquí?',
    ];
  }

  List<String> _italianEmergencyPatterns() {
    return [
    'Chiama l ambulanza!',
    'Ho bisogno di aiuto immediato.',
    'Cè un ospedale qui vicino?',
    'Per favore, chiama la polizia.',
    'Ho avuto un incidente.',
    'Dovè il più vicino corpo dei pompieri?',
    'Sto avendo un emergenza medica.',
    'Aiutami, per favore!',
    'Mi sono perso e ho bisogno di assistenza.',
    'Cè una farmacia qui intorno?',
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
    home: EmergencyPage(),
  ));
}
