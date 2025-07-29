import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({required this.label, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("Filtro selecionado: $label");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200], // Cor de fundo
          borderRadius: BorderRadius.circular(16), // Bordas arredondadas
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, // Cor do texto
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}