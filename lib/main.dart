// import 'package:aplicacao_flutter/screens/preferences_screen.dart';
import 'package:aplicacao_flutter/screens/events_screen.dart';
import 'package:aplicacao_flutter/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove a faixa de DEBUG
      debugShowCheckedModeBanner: false,
      // Home recebe nosso primeiro Wifget
      // que será exibido pelo aplicativo
      home: const EventsScreen(),
    );
  }
}
