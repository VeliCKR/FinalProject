import 'package:flutter/material.dart';

class HobbyPage extends StatefulWidget {
  const HobbyPage({super.key});

  @override
  _HobbyPageState createState() => _HobbyPageState();
}

class _HobbyPageState extends State<HobbyPage> with SingleTickerProviderStateMixin {
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
          'Hobby Expressions',
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
            _buildTab('English', '🇺🇸', _englishHobbyPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishHobbyPatterns()),
            _buildTab('Italian', '🇮🇹', _italianHobbyPatterns()),
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
            _buildPatternList(_englishHobbyPatterns()),
            _buildPatternList(_spanishHobbyPatterns()),
            _buildPatternList(_italianHobbyPatterns()),
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

  List<String> _englishHobbyPatterns() {
    return [
    'I enjoy reading books in my free time.',
    'Painting is my favorite hobby.',
    'I love playing musical instruments.',
    'Gardening is a relaxing hobby for me.',
    'I often go hiking on weekends.',
    'Cooking is both a hobby and a passion.',
    'I like collecting stamps.',
    'Photography is a creative outlet for me.',
    'Playing video games is my way of unwinding.',
    'I am into DIY and home improvement projects.',
    ];
  }

  List<String> _spanishHobbyPatterns() {
    return [
      'Disfruto leyendo libros en mi tiempo libre.',
      'La pintura es mi pasatiempo favorito.',
      'Me encanta tocar instrumentos musicales.',
      'La jardinería es un pasatiempo relajante para mí.',
      'A menudo voy de excursión los fines de semana.',
      'Cocinar es tanto un hobby como una pasión.',
      'Me gusta coleccionar sellos.',
      'La fotografía es una salida creativa para mí.',
      'Jugar videojuegos es mi forma de relajarme.',
      'Me gustan los proyectos de bricolaje y mejoras para el hogar.',
    ];
  }

  List<String> _italianHobbyPatterns() {
    return [
      'Mi piace leggere libri nel mio tempo libero.',
      'La pittura è il mio hobby preferito.',
      'Amo suonare strumenti musicali.',
      'Il giardinaggio è un hobby rilassante per me.',
      'Vado spesso a fare escursioni nei weekend.',
      'Cucinare è sia un hobby che una passione.',
      'Mi piace collezionare francobolli.',
      'La fotografia è una forma di espressione creativa per me.',
      'Giocare ai videogiochi è il mio modo di rilassarmi.',
      'Mi piacciono i progetti fai-da-te e di miglioramento della casa.',
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
    home: HobbyPage(),
  ));
}
