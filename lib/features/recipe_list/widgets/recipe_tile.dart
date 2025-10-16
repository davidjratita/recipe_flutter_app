import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recipe/core/models/recipe.dart.dart';
import '../../recipe_detail/views/recipe_detail_page.dart';


// REPLACED THIS INITIAL WIDET WITH A GRID TILE
class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  const RecipeTile({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: recipe.image,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(recipe.name),
      subtitle: Text(recipe.category),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeDetailPage(recipeId: recipe.id),
          ),
        );
      },
    );
  }
}
