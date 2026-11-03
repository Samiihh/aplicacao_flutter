import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// Essa class ela guarda o estado da tela
class _RegisterScreenState extends State<RegisterScreen> {
  // GlobalKey cria uma chave  que permite acessar um widget  e o seu estado associado
  // <FormState> informa que essa chave sera usada especificamente para acessa o estado de um form
  // final significa que _formkey recebera esta chave um unica vez e não sera substituida por outra
  final _formKey = GlobalKey<FormState>();

  // variavel par armazenar a senha digitada
  String _senha = '';
  bool _ocultarSenha = true; // informa que a senha começa oculta
  bool _ocultarConfirmacao =
      true; // controla separadamente a confirmação de senha
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),

      body: SingleChildScrollView(
        child: Padding(
          // Espaçamento interno em todos os lados de 16px
          padding: const EdgeInsets.all(16),

          // Form agrupa os campos que serão validados
          child: Form(
            key: _formKey,
            child: Column(
              // Em colunm o eixo transversal é horizontal
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  'Crie sua conta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const Divider(),

                const Text('Preencha os campos abaixo para o continuar.'),

                SizedBox(height: 24),

                TextFormField(
                  // decoration recebe o InputDecoration responsavel pela aparença do campo
                  decoration: const InputDecoration(
                    labelText: 'Nome completo',
                    hintText: 'Digite seu nome',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),

                  // Validator recebe um função, e value representa o texto atual do campo
                  validator: (value) {
                    // validação de campos null e vazios
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu nome';
                    }

                    // validadação de quantidade de caracteres
                    if (value.trim().length < 3) {
                      return ' Digitar pelo menos 3 caracteres.';
                    }

                    // null significa que nenhum erro foi encontrado
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome@exemplo.com',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),

                  // sugere um teclado adeguado para email
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe seu email ';
                    }

                    // contains(@) verifica se existe o @.
                    if (!value.contains('@')) {
                      return 'Digite um email valido.';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _ocultarSenha = !_ocultarSenha;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarSenha,

                  onChanged: (value) {
                    _senha = value;
                  },

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe uma senha ';
                    }

                    if (value.length < 6) {
                      return 'Use pelo menos 6 caracteres';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 24),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha',
                    hintText: 'Digite a senha novamente',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _ocultarConfirmacao
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _ocultarConfirmacao = !_ocultarConfirmacao;
                        });
                      },
                    ),
                  ),

                  obscureText: _ocultarConfirmacao,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirme uma senha ';
                    }

                    if (value != _senha) {
                      return 'As senhas não coincidem';
                    }

                    return null;
                  },
                ),

                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final formularioValidado =
                          _formKey.currentState?.validate() ?? false;

                      if (formularioValidado) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('cadastro realizado com sucesso'),
                          ),
                        );
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
