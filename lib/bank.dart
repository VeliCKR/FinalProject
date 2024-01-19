import 'package:flutter/material.dart';

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> with SingleTickerProviderStateMixin {
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
          'Bank Expressions',
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
            _buildTab('English', '🇺🇸', _englishBankPatterns()),
            _buildTab('Spanish', '🇪🇸', _spanishBankPatterns()),
            _buildTab('Italian', '🇮🇹', _italianBankPatterns()),
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
            _buildPatternList(_englishBankPatterns()),
            _buildPatternList(_spanishBankPatterns()),
            _buildPatternList(_italianBankPatterns()),
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

  List<String> _englishBankPatterns() {
    return [
      'I would like to open a new account.',
      'What are the current interest rates?',
      'How can I apply for a loan?',
      'Is there an ATM nearby?',
      'What is my account balance?',
      'Can I get a credit card?',
      'I need to transfer money to another account.',
      'Are there any fees for wire transfers?',
      'How do I set up online banking?',
      'Thank you for your assistance!',
    ];
  }

  List<String> _spanishBankPatterns() {
    return [
      'Me gustaría abrir una nueva cuenta.',
      '¿Cuáles son las tasas de interés actuales?',
      '¿Cómo puedo solicitar un préstamo?',
      '¿Hay un cajero automático cerca?',
      '¿Cuál es el saldo de mi cuenta?',
      '¿Puedo obtener una tarjeta de crédito?',
      'Necesito transferir dinero a otra cuenta.',
      '¿Hay tarifas por transferencias electrónicas?',
      '¿Cómo configuro la banca en línea?',
      '¡Gracias por su ayuda!',
    ];
  }

  List<String> _italianBankPatterns() {
    return [
      'Vorrei aprire un nuovo conto.',
      'Quali sono i tassi di interesse attuali?',
      'Come posso richiedere un prestito?',
      'C\'è un bancomat nelle vicinanze?',
      'Qual è il saldo del mio conto?',
      'Posso ottenere una carta di credito?',
      'Ho bisogno di trasferire denaro su un\'altra conto.',
      'Ci sono spese per i bonifici bancari?',
      'Come faccio a configurare la banca online?',
      'Grazie per il tuo assistenza!',
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
    home: BankPage(),
  ));
}
