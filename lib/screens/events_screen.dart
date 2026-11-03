import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  // cria um obejeto para gurdada os dados.
  State<EventsScreen> createState() {
    return _EventsScreenState();
  }
}

class _EventsScreenState extends State<EventsScreen> {
  // variavel para guardaro texto digitado.
  String textoDigitado = '';

  // Essas mensagem aparecem antes da primeira ação
  String mensagemEnviada = 'Nenhuma mensagem envidada';
  String ultimoEvento = 'Nenhuma interação ainda';

  int toques = 0;
  int toquesDuplos = 0;
  int toquesLongos = 0;

  void atualizarTexto(String novoTexto) {
    setState(() {
      textoDigitado = novoTexto;
      ultimoEvento = 'onChanged: Texto alterado';
    });
  }

  @override
  // build descreve a interface exibida pelo flutter.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos e interações')),
      
      // SingleChildScrollView permite rolar se o teclado ocupar toda a parte da tela
      body: SingleChildScrollView(

      )
    );
  }
}
