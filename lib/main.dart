import 'package:flutter/material.dart';
import 'package:lipo/ajuda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.menu_book_outlined,
    // Icons.shopping_cart_outlined,
    // Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, //Cor de fundo da tela
        child: Row(
          children: [
            // Sidebar
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ), // Espaço nas laterais
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
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
                        color: Colors.transparent, // Cor de fundo
                        borderRadius: BorderRadius.circular(
                          16,
                        ), // Bordas arredondadas
                      ),
                      child: Icon(
                        Icons.help, // Ícone do botão
                        color: Colors.black54, // Cor do ícone
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Espaço restante (conteúdo principal)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LiPo - Linguagem em Portugol",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      SizedBox(height: 16),

                      Wrap(
                        spacing: 8.0,//Espaço horizontal entre os botões
                        runSpacing: 8.0,// Espaço vertical entre os botões (caso quebre linha)
                        children: [
                          FilterButton(label: "Tudo", isSelected: true),
                          FilterButton(label: "Teste", isSelected: false),
                          FilterButton(label: "Teste", isSelected: false),
                          FilterButton(label: "Teste", isSelected: false),
                          FilterButton(label: "Teste", isSelected: false),
                        ],
                      ),
                      SizedBox(height: 24),
                      Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        children: List.generate(8, (index) {
                          return Container(
                            width: 300, // Largura
                            height: 200, // Altura
                            decoration: BoxDecoration(
                              color: Colors.blue[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ação ao clicar no botão de filtro
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
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
