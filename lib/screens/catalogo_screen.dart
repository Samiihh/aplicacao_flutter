// Tela de Catalogo

import 'package:flutter/material.dart';

// A tela apresenta uma lista fixa de produtos e não mantém estado mutável próprio.
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // dados do nosso catalogo
  // List<String> Siginifica:
  // List -> uma coleção de valores;
  // String -> é que cada valor sera guardado em formato de texto;
  // final impede trocar a referência da lista; const também impede alterar seus itens.
  final List<String> produtos = const [
    'Notebook',
    'Celular',
    'Headset',
    'Teclado',
    'Mouse',
    'Monitor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogo')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produtos em destaque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),
            // A listview sera adicionada aqui

            SizedBox(
              // Como a nossa listview sera horizontal, precisamos reservas uma altura para essa aerea, que ela podera ocupar
              height: 120,

              // builder cria os itens conforme são necessários para a lista rolável,
              // em vez de declarar manualmente um widget para cada produto.
              child: ListView.builder(
                // Por padrão, a listview rola verticalmente
                //Axis.horizontal muda a direção da rolagem
                scrollDirection: Axis.horizontal,

                // Define quantos itens a listview irá contruir
                itemCount: produtos.length,

                //descreve como cada item sera montado
                // index começa em zero e identifica o produto que está sendo apresentado.
                // O builder retorna o widget que ocupa essa posição na lista ou na grade.
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    // margin cria espaço externo à direita; padding cria espaço dentro do cartão.
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, size: 32),
                        const SizedBox(height: 8),

                        Text(
                          // Index indical qual a posição esta sendo contruida
                          produtos[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Todos os Produto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            // Nossa GridView sera adicionada aqui
            //Expanded utiliza o espaço que ainda estiver disponivel dentro da column.
            // A parte superiro da tela ja possui o titulo ListView.
            // O gridview pode ocupar o restante.
            // A Column oferece ao Expanded a altura restante após títulos e lista horizontal.
            // Isso fornece uma altura limitada à grade, que possui sua própria rolagem.
            Expanded(
              // A grade usa os mesmos produtos da lista horizontal, com outro formato de apresentação.
              child: GridView.builder(
                itemCount: produtos.length,
                // Em uma gridview vertical
                // O delegate define a distribuição e as dimensões das células da grade.
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // representa a quantidade de coluna
                  crossAxisCount: 2,
                  //espaço horizontal entre as colunas
                  crossAxisSpacing: 12,
                  //  espaço vertical entre as linhas
                  mainAxisSpacing: 12,
                  //controla a porporção largura x altura
                  // A proporção é largura dividida por altura: 1.2 torna a célula mais larga que alta.
                  childAspectRatio: 1.2,
                ),

                // index começa em zero e identifica o produto que está sendo apresentado.
                // O builder retorna o widget que ocupa essa posição na lista ou na grade.
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_bag, size: 40),

                        const SizedBox(height: 8),
                        Text(
                          produtos[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
