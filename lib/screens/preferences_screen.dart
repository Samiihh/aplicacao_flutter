import 'package:flutter/material.dart';

// StatefulWidget é usado quando a tela possui dados que podem mudar
class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  // cria o objeto que controla o estado dessa tela
  @override
  State<PreferenceScreen> createState() {
    // retorna a classe que guarda as variaveis e constri a interface
    return _PreferenceScreenState();
  }
}

// classe responsavel pelo estado e pela interface da tela
// o '_' no inicio indica que a classe é privada neste arquivo
class _PreferenceScreenState extends State<PreferenceScreen> {
  // guarda o nome digitado
  String nome = '';
  //
  String? linguagem;

  String nivel = 'Iniciante';

  bool estudarFlutter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferências')),

      // permite rolar a tela quando o conteudo não caber
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configure suas preferências',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (novoValor) {
                  setState(() {
                    nome = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),

              // menu suspenso para escolher uma linguagem
              DropdownButton<String>(
                // indica qual opção está selecionada
                value: linguagem,
                // Faz o menu ocupar a largura disponivel
                isExpanded: true,
                // texto exibido quando não há seleção
                hint: const Text('Escolha uma linguagem'),
                // opções disponiveis
                items: const [
                  DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
                  DropdownMenuItem(
                    value: 'JavaScript',
                    child: Text('JavaScript'),
                  ),
                  DropdownMenuItem(value: 'Python', child: Text('Python')),
                  DropdownMenuItem(value: 'Node.js', child: Text('Node.js')),
                ],
                onChanged: (novoValor) {
                  setState(() {
                    linguagem = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Nível de conhecimento',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              // opção de nivel
              RadioListTile<String>(
                title: const Text('iniciante'),
                // valor que ele representa
                value: 'Iniciante',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor) {
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('intermediario'),
                // valor que ele representa
                value: 'Intermediario',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor) {
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

              RadioListTile<String>(
                title: const Text('avançado'),
                // valor que ele representa
                value: 'avançado',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor) {
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

              const Divider(),

              SwitchListTile(
                title: const Text('Quero estudar Flutter'),

                value: estudarFlutter,

                onChanged: (novoValor) {
                  setState(() {
                    estudarFlutter = novoValor;
                  });
                },
              ),

              const SizedBox(height: 20),
              // Botão para mostrar as preferencias
              ElevatedButton(
                // função executada quando o botão é pressionado
                onPressed: () {
                  showDialog(
                    context: context,
                    // constroi conteudo da janela
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Suas preferências'),

                        // mostra os valores guardados nas variaveis
                        content: Text(
                          'Nome: $nome\n'
                          'Linguagem: ${linguagem ?? "Não selecionada"}\n'
                          'Nível: $nivel\n',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Mostrar preferências'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
