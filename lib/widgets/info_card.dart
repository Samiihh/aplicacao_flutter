// WIDGET REUTILIZAVEL DE INFORMAÇÕES
import 'package:flutter/material.dart';

//componente reutilizavel, a mesma estrutura visual  recebe dados diferente
// widget recebe os dados pelo contrutor
class InfoCard extends StatelessWidget {
  //variaveis para amarzenar os dados recebidos
  final IconData? icon;
  final String label;
  final String text;

  const InfoCard({
    super.key,
    this.icon,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Solicita todas as largura permitida pelo pai, sem ultrapassar as bordas
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // define a cor de fundo
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      // Row organiza icone, espaço e o texto, nessa ordem
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
