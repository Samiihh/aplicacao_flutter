import 'package:flutter/material.dart';

class AparenciaScreens extends StatelessWidget {
  const AparenciaScreens({
    super.key,
    required this.modoAtual,
    required this.aoAlterarTema,
  });

  // O modo selecionado é enviado pelo myApp.
  final ThemeMode modoAtual;

  // Função que recebe o ThemeMode e não retorna nenhum valor
  final void Function(ThemeMode) aoAlterarTema;

  @override
  Widget build(BuildContext context) {
    // Theme.of(contex) le o nosso ativo nesta tela
    final cores = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Aparencia')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Escolha  o tema do aplicativo',
                style: TextStyle(fontSize: 22),
              ),

              const SizedBox(height: 16),

              SegmentedButton<ThemeMode>(
                segments: const [
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text('Sistema'),
                  ),
                  ButtonSegment(value: ThemeMode.light, label: Text('Claro')),
                  ButtonSegment(value: ThemeMode.dark, label: Text('Escuro')),
                ],
                selected: {modoAtual},
                onSelectionChanged: (novosModos) {
                  // O conjunto tem uma opção selecionada.
                  aoAlterarTema(novosModos.first);
                },
              ),

              const SizedBox(height: 24),
              // Primeiro Cartão
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cores.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Esse cartão acompanha o tema!',
                  style: TextStyle(color: cores.onPrimaryContainer),
                ),
              ),

              const SizedBox(height: 16),


              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(

                  // surfaceContainerHighest é uma cor de superfice fornecida pelo tema
                  // Ela muda automaticamente conforme o tema claro ou escuro.
                  color: cores.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: [
                    // onSurface é uma cor apropriada para textos e icones presentados sobre a duperfies do tema
                    Icon(Icons.palette, size: 40, color: cores.onSurface),

                    const SizedBox(height: 12),

                    Text(
                      'Personalização Visual',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                        color: cores.onSurface,
                      ),
                    ),
                  ],
                ),
              ),

              const FilledButton(
                // Um callback null deixa o botão desabilitado, sem ação.
                onPressed: null,
                child: Text('Botão Exemplo'),
              ),

              const SizedBox(height: 16),

              Text(
                'Modo selelcionado: ${modoAtual.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
