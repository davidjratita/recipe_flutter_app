import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/core/models/recipe.dart.dart';
import '../constants.dart';

class MealApi {
  final String baseUrl = AppConstants.baseUrl;

  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/search.php?s=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['meals'] as List?;
      return data?.map((e) => Recipe.fromJson(e)).toList() ?? [];
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<Recipe> fetchRecipeDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['meals'][0];
      return Recipe.fromJson(data);
    } else {
      throw Exception('Failed to load recipe detail');
    }
  }
}
