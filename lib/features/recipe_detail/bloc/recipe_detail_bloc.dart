import 'package:bloc/bloc.dart';
import 'package:recipe/core/api/meal_api.dart';
import 'recipe_detail_event.dart';
import 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final MealApi api;

  RecipeDetailBloc(this.api) : super(RecipeDetailInitial()) {
    on<LoadRecipeDetail>((event, emit) async {
      emit(RecipeDetailLoading());
      try {
        final recipe = await api.fetchRecipeDetail(event.id);
        emit(RecipeDetailLoaded(recipe: recipe));
      } catch (e) {
        emit(RecipeDetailError(message: e.toString()));
      }
    });
  }
}
