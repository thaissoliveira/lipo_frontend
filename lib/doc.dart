import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajuda"),
      ),
      body: Center(
        child: Text(
          "Bem-vindo à página de ajuda!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}