import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with SingleTickerProviderStateMixin {
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
          'Restaurant Expressions',
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
            _buildTab('English', '🇺🇸', _englishRestaurantPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishRestaurantPatterns()),
            _buildTab('Italian', '🇮🇹', _italianRestaurantPatterns()),
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
            _buildPatternList(_englishRestaurantPatterns()),
            _buildPatternList(_spanishRestaurantPatterns()),
            _buildPatternList(_italianRestaurantPatterns()),
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

  List<String> _englishRestaurantPatterns() {
    return [
      'Table for two, please.',
      'Can I see the menu?',
      'What is the chef\'s special?',
      'I would like to order...',
      'How spicy is this dish?',
      'Is tap water free?',
      'Could we get the check, please?',
      'Do you have vegetarian options?',
      'Is service charge included?',
      'Thank you for the delicious meal!',
    ];
  }

  List<String> _spanishRestaurantPatterns() {
    return [
      'Mesa para dos, por favor.',
      '¿Puedo ver el menú?',
      '¿Cuál es la especialidad del chef?',
      'Me gustaría ordenar...',
      '¿Qué tan picante es este platillo?',
      '¿El agua del grifo es gratis?',
      '¿Podríamos obtener la cuenta, por favor?',
      '¿Tienen opciones vegetarianas?',
      '¿Está incluido el cargo por servicio?',
      '¡Gracias por la deliciosa comida!',
    ];
  }

  List<String> _italianRestaurantPatterns() {
    return [
      'Tavolo per due, per favore.',
      'Posso vedere il menu?',
      'Qual è la specialità dello chef?',
      'Vorrei ordinare...',
      'Quanto è piccante questo piatto?',
      'L\'acqua del rubinetto è gratuita?',
      'Possiamo avere il conto, per favore?',
      'Avete opzioni vegetariane?',
      'Il servizio è incluso?',
      'Grazie per il delizioso pasto!',
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
    home: RestaurantPage(),
  ));
}
