import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final List<String> ingredients;
  const IngredientList({required this.ingredients, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map((ingredient) => Row(
                children: [
                  const Icon(Icons.circle, size: 6),
                  const SizedBox(width: 8),
                  Text(ingredient),
                ],
              ))
          .toList(),
    );
  }
}
