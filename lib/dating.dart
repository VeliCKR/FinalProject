import 'package:flutter/material.dart';

class DatingPage extends StatefulWidget {
  const DatingPage({Key? key}) : super(key: key);

  @override
  _DatingPageState createState() => _DatingPageState();
}

class _DatingPageState extends State<DatingPage> with SingleTickerProviderStateMixin {
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
          'Dating Expressions',
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
            _buildTab('English', '🇺🇸', _englishDatingPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishDatingPatterns()),
            _buildTab('Italian', '🇮🇹', _italianDatingPatterns()),
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
            _buildPatternList(_englishDatingPatterns()),
            _buildPatternList(_spanishDatingPatterns()),
            _buildPatternList(_italianDatingPatterns()),
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

  List<String> _englishDatingPatterns() {
    return [
      'Hi, my name is...',
      'What do you do for a living?',
      'Do you come here often?',
      'Would you like to go out for dinner sometime?',
      'What are your hobbies?',
      'Can I get your phone number?',
      'I had a great time, would you like to meet again?',
      'What\'s your favorite type of music/movie/book?',
      'Do you believe in love at first sight?',
      'It was nice meeting you!',
    ];
  }

  List<String> _spanishDatingPatterns() {
    return [
      'Hola, mi nombre es...',
      '¿A qué te dedicas?',
      '¿Vienes aquí a menudo?',
      '¿Te gustaría salir a cenar algún día?',
      '¿Cuáles son tus hobbies?',
      '¿Puedo tener tu número de teléfono?',
      'La pasé muy bien, ¿te gustaría volver a encontrarnos?',
      '¿Cuál es tu tipo de música/película/libro favorito?',
      '¿Crees en el amor a primera vista?',
      'Fue un gusto conocerte',
    ];
  }

  List<String> _italianDatingPatterns() {
    return [
      'Ciao, mi chiamo...',
      'Cosa fai nella vita?',
      'Vieni qui spesso?',
      'Ti piacerebbe uscire a cena qualche volta?',
      'Quali sono i tuoi hobby?',
      'Posso avere il tuo numero di telefono?',
      'Mi sono divertito molto, ti piacerebbe incontrarci di nuovo?',
      'Qual è il tuo genere di musica/film/libro preferito?',
      'Credi nell\'amore a prima vista?',
      'È stato un piacere conoscerti',
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
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListTile(
        title: Text(
          pattern,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        onTap: () {
          // Burada kullanıcının dokunma olayına yanıt verecek işlemleri ekleyebilirsiniz.
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DatingPage(),
  ));
}


