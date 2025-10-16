import 'package:equatable/equatable.dart';

abstract class RecipeDetailEvent extends Equatable {
  const RecipeDetailEvent();
  @override
  List<Object> get props => [];
}

class LoadRecipeDetail extends RecipeDetailEvent {
  final String id;
  const LoadRecipeDetail(this.id);
  @override
  List<Object> get props => [id];
}
