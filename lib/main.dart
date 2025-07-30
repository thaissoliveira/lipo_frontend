import 'package:flutter/material.dart';
import 'package:lipo/ajuda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0; // Índice do item selecionado na sidebar
  String selectedFilter = "Visão Geral"; // Filtro inicial

  final List<IconData> icons = [Icons.home_outlined, Icons.menu_book_outlined];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Ícones de navegação
                  Column(
                    children: List.generate(icons.length, (index) {
                      bool isSelected = selectedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              icons[index],
                              color: isSelected ? Colors.white : Colors.black54,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  // Botão de ajuda
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HelpPage()),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(Icons.help, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),

            // Conteúdo principal com título fixo
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Cabeçalho fixo
                    Text(
                      "LiPo - Linguagem em Portugol",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "LiPo é uma linguagem de programação educacional que utiliza palavras-chave em português para facilitar o aprendizado.\nFoi projetada para ser simples, expressiva e familiar aos falantes de português!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 16),

                    // ✅ Área rolável: filtros + conteúdo
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Filtros
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                _buildFilterButton("Visão Geral"),
                                _buildFilterButton("Estrutura Léxica"),
                                _buildFilterButton("Tipos de Dados"),
                                _buildFilterButton("Literais"),
                                _buildFilterButton("Variáveis e Constantes"),
                                _buildFilterButton("Operadores"),
                                _buildFilterButton("Estruturas de Controle"),
                                _buildFilterButton("Sistema de import"),
                                _buildFilterButton("Comentários"),
                                _buildFilterButton("Gramática formal"),
                                _buildFilterButton("Exemplos"),
                              ],
                            ),
                            SizedBox(height: 24),

                            // Conteúdo dinâmico abaixo dos filtros
                            _buildFilterContent(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Botão de filtro dinâmico
  Widget _buildFilterButton(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Conteúdo dinâmico de acordo com o filtro selecionado
  Widget _buildFilterContent() {
    switch (selectedFilter) {
      case "Visão Geral":
        return Text(
          "📌 Características Principais:\n\n"
          "◾ Sintaxe em Português: Palavras-chave em português brasileiro\n"
          "◾ Tipagem Estática: Tipos são verificados em tempo de compilação\n"
          "◾ Inferência de Tipos: O compilador pode inferir tipos automaticamente\n"
          "◾ Conversão Automática: Inteiros são convertidos automaticamente para reais quando necessário",
          style: TextStyle(fontSize: 18),
        );
      case "Estrutura Léxica":
        return Text(
          "A estrutura léxica define as regras para formação dos tokens...",
          style: TextStyle(fontSize: 18),
        );
      case "Tipos de Dados":
        return Text(
          "Os tipos de dados em LiPo incluem inteiro, real, texto, etc...",
          style: TextStyle(fontSize: 18),
        );
      case "Literais":
        return Text(
          "Literais representam valores fixos no código...",
          style: TextStyle(fontSize: 18),
        );
      case "Variáveis e Constantes":
        return Text(
          "Variáveis armazenam valores mutáveis; constantes armazenam valores imutáveis.",
          style: TextStyle(fontSize: 18),
        );
      case "Operadores":
        return Text(
          "Operadores aritméticos, relacionais e lógicos são suportados pela linguagem.",
          style: TextStyle(fontSize: 18),
        );
      case "Estruturas de Controle":
        return Text(
          "As estruturas de controle incluem: SE, SENÃO, ENQUANTO, PARA...",
          style: TextStyle(fontSize: 18),
        );
      case "Sistema de import":
        return Text(
          "LiPo permite importar bibliotecas utilizando a palavra-chave 'importar'.",
          style: TextStyle(fontSize: 18),
        );
      case "Comentários":
        return Text(
          "Comentários são escritos utilizando // para linha e /* */ para bloco.",
          style: TextStyle(fontSize: 18),
        );
      case "Gramática formal":
        return Text(
          "A gramática formal define a sintaxe oficial da linguagem.",
          style: TextStyle(fontSize: 18),
        );
      case "Exemplos":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Exemplo de código LiPo:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("""
algoritmo "Exemplo"
variável
  inteiro x
início
  escreva("Olá Mundo!")
fim
""", style: TextStyle(fontSize: 16, fontFamily: "monospace")),
            ),
          ],
        );
      default:
        return Text(
          "Selecione um filtro para ver o conteúdo.",
          style: TextStyle(fontSize: 18),
        );
    }
  }
}
