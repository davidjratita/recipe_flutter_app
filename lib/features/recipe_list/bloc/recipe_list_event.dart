import 'package:equatable/equatable.dart';

abstract class RecipeListEvent extends Equatable {
  const RecipeListEvent();
  @override
  List<Object> get props => [];
}

class LoadRecipes extends RecipeListEvent {
  final String query;
  final int page;
  const LoadRecipes({this.query = '', this.page = 1});
  @override
  List<Object> get props => [query, page];
}
