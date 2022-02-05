import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'screens/home.dart';

void main() {
  runApp(Weather());
}

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.id,
      routes: {
        Home.id: (context) => Home(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
    );
  }
}