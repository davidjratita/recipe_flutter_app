import 'package:equatable/equatable.dart';
import 'package:recipe/core/models/recipe.dart.dart';


abstract class RecipeDetailState extends Equatable {
  const RecipeDetailState();
  @override
  List<Object> get props => [];
}

class RecipeDetailInitial extends RecipeDetailState {}
class RecipeDetailLoading extends RecipeDetailState {}
class RecipeDetailLoaded extends RecipeDetailState {
  final Recipe recipe;
  const RecipeDetailLoaded({required this.recipe});
  @override
  List<Object> get props => [recipe];
}
class RecipeDetailError extends RecipeDetailState {
  final String message;
  const RecipeDetailError({required this.message});
  @override
  List<Object> get props => [message];
}
