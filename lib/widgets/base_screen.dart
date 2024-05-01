import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/HomePage/course_screen.dart';
import 'package:sneakers_app/pages/Loginpages/Profile_Page.dart';
import 'package:sneakers_app/pages/Crypto/home.dart';
import 'package:sneakers_app/pages/QuizPage/screens/QuizPage.dart';
import 'package:sneakers_app/pages/StorePAge/Market_page.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),  // Écran vedette
    QuizHomeScreen(),  // Écran du quiz
    MarketPage(),          // Écran du marché
        StatisticsScreen(),  // Écran du quiz
    Profile(),      
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        backgroundColor: Color.fromARGB(255, 226, 240, 254),
        elevation: 100, // Réduit la hauteur visuelle de la barre de navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Marché",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: "Portfilio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
