import 'package:flutter/material.dart';
import 'package:finalproject/accomodation.dart';
import 'package:finalproject/bank.dart';
import 'package:finalproject/chatbox.dart';
import 'package:finalproject/dating.dart';
import 'package:finalproject/emergency.dart';
import 'package:finalproject/hobby.dart';
import 'package:finalproject/plane.dart';
import 'package:finalproject/restaurant.dart';
import 'package:finalproject/shopping.dart';
import 'package:finalproject/travel.dart';
import 'package:finalproject/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageUrls = [
    'assets/image/alisveris.jpg',
    'assets/image/seyehat.png',
    'assets/image/weather.jpg',
    'assets/image/yemek.jpg',
    'assets/image/bank.png',
    'assets/image/emergency.png',
    'assets/image/hobi.png',
    'assets/image/konaklama.jpg',
    'assets/image/plane.png',
    'assets/image/meeting.jpg',
  ];

  String getGreeting() {
    var hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      return 'Günaydın';
    } else if (hour >= 12 && hour < 17) {
      return 'Tünaydın';
    } else if (hour >= 17 && hour < 23) {
      return 'İyi Akşamlar';
    } else {
      return 'İyi Geceler';
    }
  }

  // Seçilen avatar index'ini tutan değişken
  int selectedAvatarIndex = 0;

  // Avatar resimlerinin listesi
  final List<String> avatarUrls = [
    'assets/image/avatar1.png',
    'assets/image/avatar2.png',
    'assets/image/avatar3.png',
    'assets/image/avatar5.jpg',
    'assets/image/avatar6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/backround.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  // Avatar'a tıklandığında yapılacak işlemleri burada tanımla
                  _showAvatarSelectionDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatarUrls[selectedAvatarIndex]),
                  ),
                ),
              ),
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${getGreeting()}👋',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/backround.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: 10, // Toplam 10 grid
          itemBuilder: (context, index) {
            final bolumBaslangic = index * 100 + 1;
            final bolumBitis = (index + 1) * 100;
            final imageUrl = imageUrls[index % imageUrls.length];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Sadece 1. gride tıklanıldığında ShoppingPage'e yönlendir
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShoppingPage()),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TravelPage()),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WeatherPage()),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RestaurantPage()),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BankPage()),
                      );
                    } else if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmergencyPage()),
                      );
                    } else if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HobbyPage()),
                      );
                    } else if (index == 7) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AccomodationPage()),
                      );
                    } else if (index == 8) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PlanePage()),
                      );
                    } else if (index == 9) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DatingPage()),
                      );
                    }
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Buraya gerekirse ek öğeler ekleyebilirsiniz.
                    ],
                  ),
                ),
              ),
            );
          },
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
              label: 'Öğren',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message, color: Colors.white),
              activeIcon: Icon(Icons.message, color: Colors.white),
              label: 'ChatBox',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
                break;
              case 2:
              // Diğer sekmelere gidin
                break;
            }
          },
        ),
      ),
    );
  }

  // Avatar seçimini yapmak için dialog gösteren fonksiyon
  void _showAvatarSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Avatar Seçin'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                avatarUrls.length,
                    (index) => InkWell(
                  onTap: () {
                    // Seçilen avatar'ın index'ini güncelle
                    selectedAvatarIndex = index;
                    Navigator.pop(context); // Dialog'ü kapat
                    setState(() {}); // Ekranı yeniden çiz
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 40.0, // Avatar büyüklüğünü buradan ayarlayın
                      backgroundImage: AssetImage(avatarUrls[index]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}