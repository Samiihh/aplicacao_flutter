import 'package:aplicacao_flutter/mainAntiga.dart';
import 'package:aplicacao_flutter/screens/perfil_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // system usa a preferencia de aparencia do aparelho
  ThemeMode modoAtual = ThemeMode.system;

  void alterarTema(ThemeMode novoModo) {
    setState(() {
      modoAtual = novoModo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // thema representa a configuração visual clara
      // ThemeData agrupa as configurações visuais
      theme: ThemeData(
        // colorScheme ele define a paletas de cores
        // ColorScheme.fromSeed ele gera as paletas apartir de uma cor base
        colorScheme: ColorScheme.fromSeed(
          // ele detarmina a principal cor da paleta
          seedColor: Colors.teal,
          // gera as cores adquadas de acordo com o modo ( claro ou escuro)
          brightness: Brightness.light,
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),

      // definir qual das duas configurações, sera usada
      // o valor do estado determina se MaterialApp usa theme ou darkTheme
      themeMode: modoAtual,

      home: const PerfilScreen(),
    );
  }
}
