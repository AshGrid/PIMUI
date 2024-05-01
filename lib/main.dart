import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_app/pages/Loginpages/welcome_page.dart';
import 'package:sneakers_app/pages/QuizPage/screens/congrats_page.dart';
import 'package:sneakers_app/pages/QuizPage/screens/profile_page.dart';
import 'package:sneakers_app/pages/QuizPage/screens/QuizPage.dart';
import 'package:sneakers_app/pages/QuizPage/screens/USerRank.dart';
import 'package:sneakers_app/pages/StorePAge/CarteProvider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(), // Create your provider instance
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Quicksand',
        ),
        title: 'Eduprime',
        home: WelcomePage(), // Set the initial route to the WelcomePage or any other initial page you have
      ),
    );
  }
}
