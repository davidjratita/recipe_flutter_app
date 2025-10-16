import 'package:bloc/bloc.dart';
import 'package:recipe/core/api/meal_api.dart';
import 'package:recipe/core/models/recipe.dart.dart';
import 'recipe_list_event.dart';
import 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final MealApi api;

  RecipeListBloc(this.api) : super(RecipeListInitial()) {
    on<LoadRecipes>((event, emit) async {
      if (state is RecipeListLoading) return;

      List<Recipe> oldRecipes = [];
      if (state is RecipeListLoaded && event.page > 1) {
        oldRecipes = (state as RecipeListLoaded).recipes;
      }

      emit(RecipeListLoading());
      try {
        final newRecipes = await api.searchRecipes(event.query);
        final startIndex = (event.page - 1) * 10;
        final endIndex = startIndex + 10;
        final pagedRecipes = newRecipes.sublist(
            startIndex, endIndex > newRecipes.length ? newRecipes.length : endIndex);
        emit(RecipeListLoaded(recipes: [...oldRecipes, ...pagedRecipes]));
      } catch (e) {
        emit(RecipeListError(message: e.toString()));
      }
    });
  }
}
