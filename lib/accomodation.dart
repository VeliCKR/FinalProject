import 'package:flutter/material.dart';

class AccomodationPage extends StatefulWidget {
  const AccomodationPage({Key? key}) : super(key: key);

  @override
  _AccomodationPageState createState() => _AccomodationPageState();
}

class _AccomodationPageState extends State<AccomodationPage> with SingleTickerProviderStateMixin {
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
          'Accomodation Expressions',
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
            _buildTab('English', '🇺🇸', _englishAccomodationPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishAccomodationPatterns()),
            _buildTab('Italian', '🇮🇹', _italianAccomodationPatterns()),
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
            _buildPatternList(_englishAccomodationPatterns()),
            _buildPatternList(_spanishAccomodationPatterns()),
            _buildPatternList(_italianAccomodationPatterns()),
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

  List<String> _englishAccomodationPatterns() {
    return [
      'I would like to make a reservation.',
      'Is breakfast included in the room rate?',
      'What time is check-in and check-out?',
      'Do you have a non-smoking room?',
      'Can I get a wake-up call?',
      'Is there a gym or fitness center?',
      'How far is the hotel from the airport?',
      'Can I cancel or modify my reservation?',
      'Is there free Wi-Fi in the rooms?',
      'What amenities does the hotel offer?',
    ];
  }

  List<String> _spanishAccomodationPatterns() {
    return [
      'Me gustaría hacer una reserva.',
      '¿El desayuno está incluido en la tarifa de la habitación?',
      '¿A qué hora es el check-in y el check-out?',
      '¿Tienen habitaciones para no fumadores?',
      '¿Puedo solicitar una llamada de despertador?',
      '¿Hay un gimnasio o centro de fitness?',
      '¿Qué tan lejos está el hotel del aeropuerto?',
      '¿Puedo cancelar o modificar mi reserva?',
      '¿Hay Wi-Fi gratuito en las habitaciones?',
      '¿Qué comodidades ofrece el hotel?',
    ];
  }

  List<String> _italianAccomodationPatterns() {
    return [
    'Vorrei fare una prenotazione.',
    'La colazione è inclusa nella tariffa della camera?',
    'A che ora è il check-in e il check-out?',
    'Hai una camera per non fumatori?',
    'Posso avere una sveglia?',
    'C\'è una palestra o un centro fitness?',
    'Quanto dista l\'hotel dall\'aeroporto?',
    'Posso annullare o modificare la mia prenotazione?',
      'Cè Wi-Fi gratuito nelle camere?',
      'Quali servizi offre l hotel?',
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
    home: AccomodationPage(),
  ));
}
