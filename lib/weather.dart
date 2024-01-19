import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with SingleTickerProviderStateMixin {
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
          'Weather Expressions',
          style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
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
            _buildTab('English', '🇺🇸', _englishWeatherPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishWeatherPatterns()),
            _buildTab('Italian', '🇮🇹', _italianWeatherPatterns()),
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
            _buildPatternList(_englishWeatherPatterns()),
            _buildPatternList(_spanishWeatherPatterns()),
            _buildPatternList(_italianWeatherPatterns()),
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

  List<String> _englishWeatherPatterns() {
    return [
      'What is the weather today?',
      'Is it going to rain?',
      'What is the temperature?',
      'How windy is it?',
      'Is there a chance of snow?',
      'What is the humidity level?',
      'Is it a sunny day?',
      'Can you check the forecast?',
      'Is there a storm coming?',
      'Should I bring an umbrella?',
    ];
  }

  List<String> _spanishWeatherPatterns() {
    return [
      '¿Cómo está el clima hoy?',
      '¿Va a llover?',
      '¿Cuál es la temperatura?',
      '¿Qué tan ventoso está?',
      '¿Hay posibilidad de nieve?',
      '¿Cuál es el nivel de humedad?',
      '¿Es un día soleado?',
      '¿Puedes verificar el pronóstico?',
      '¿Viene una tormenta?',
      '¿Debería llevar un paraguas?',
    ];
  }

  List<String> _italianWeatherPatterns() {
    return [
      'Com\'è il tempo oggi?',
      'Pioverà?',
      'Qual è la temperatura?',
      'Quanto ventoso è?',
      'C\'è possibilità di neve?',
      'Qual è il livello di umidità?',
      'È una giornata di sole?',
      'Puoi controllare la previsione?',
      'Sta arrivando una tempesta?',
      'Dovrei portare un ombrello?',
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

  void main() {
    runApp(const MaterialApp(
      home: WeatherPage(),
    ));
  }

}
