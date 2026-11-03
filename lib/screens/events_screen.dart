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

    // Mostra no console o texto atualizado
    debugPrint("Texto Digitado: $textoDigitado");
  }

  void enviarMensagem(String valor) {
    // final impede reatribuir esta variavel local
    // trim() remove os espaços das extremidades.
    final mensagem = valor.trim();

    setState(() {
      // isEmpty é true quando a String é vazia.
      if (mensagem.isEmpty) {
        mensagemEnviada = 'Digite uma mensagem primeiro';
      } else {
        // se houver conteudo, registra a mensagem.
        mensagemEnviada = mensagem;
      }
      ultimoEvento = 'onSubmitted: envio solicitado';
    });
  }

  void finalizarEdicao() {
    // FocusScope gerencia qual campo está em foco.
    // unFocus remove o foco atual e normalmente faz o teclado virtual desaparecer
    FocusScope.of(context).unfocus();
  }

  void registrarToque() {
    setState(() {
      toques++;
      ultimoEvento = 'onTap : toque simples';
    });
  }

  void registrarToqueDuplo() {
    setState(() {
      toquesDuplos++;
      ultimoEvento = 'onDoubleTap: toques duplo';
    });
  }

  void registrarToqueLongo() {
    setState(() {
      toquesLongos++;
      ultimoEvento = 'onLongPress: toque mantido';
    });
  }

  @override
  // build descreve a interface exibida pelo flutter.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eventos e interações')),

      // SingleChildScrollView permite rolar se o teclado ocupar toda a parte da tela
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ), // Cria apenas 16 unidades de espço em todos os lados.
          // Column organiza os widget em colunas na vertical
          //stretch amplia os filhos na largura disponivel
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const Text(
                'Laboratório de interações',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Entrada de dados
              TextField(
                // InputDecoration define a aparencia do campo
                decoration: const InputDecoration(
                  // identifica o campo para o usuario
                  labelText: 'Digite uma mensagem',
                  // sugere um exemplo preenchido
                  hintText: 'Ex: estou aprendendo flutter',
                  //exibe uma borda ao redor  do campo
                  border: OutlineInputBorder(),
                ),
                // Entrega da função ao flutter
                // a cada mudança, o TextField fornece uma String
                onChanged: atualizarTexto,

                //Solicitando ao teclado a ação visual 'Concluido'
                // Issonão envia os dados ao um servidor
                textInputAction: TextInputAction.done,

                // Ao finalizar a entrada de dados, Flutter envia o texto, atual como arqgumento para enviar mensagem
                onSubmitted: enviarMensagem,

                // Esse callback não recebe parametro.
                // Usamos um função separada para cuidar do foco.
                onEditingComplete: finalizarEdicao,
              ),

              const SizedBox(height: 12),

              Text('Digitando: $textoDigitado'),

              const SizedBox(height: 20),

              GestureDetector(
                // Cada propriedade recebe uma função callback
                onTap: registrarToque,
                onDoubleTap: registrarToqueDuplo,
                onLongPress: registrarToqueLongo,

                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Text(
                    'Toque, toque duas vezes ou mantenha precionado',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text('Ultimo evento: $ultimoEvento'),
              const SizedBox(height: 8),

              Text('Toques simples: $toques'),
              Text('Toques duplo: $toquesDuplos'),
              Text('Toques logons: $toquesLongos'),

              const SizedBox(height: 8),

              Text('Mensagem enviada: $mensagemEnviada'),
            ],
          ),
        ),
      ),
    );
  }
}
