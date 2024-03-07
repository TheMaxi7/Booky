import 'package:flutter/material.dart';
import 'package:booky/book.dart';
import 'package:booky/sample_data.dart';

class DataManager extends ChangeNotifier {

  final List<Book> _allBooks = SampleData.allBooks;
  //final List<Recipe> _recipesOfTheDay = SampleData.recipesOfTheDay;
  //final List<Recipe> _favouriteRecipes = SampleData.favouriteRecipes;
  //final List<Recipe> _asianRecipes = SampleData.asianRecipes;

  List<Book> get allBooks => List.unmodifiable(_allBooks);
  //List<Recipe> get recipesOfTheDay => List.unmodifiable(_recipesOfTheDay);
  //List<Recipe> get favouriteRecipes => List.unmodifiable(_favouriteRecipes);
  //List<Recipe> get asianRecipes => List.unmodifiable(_asianRecipes);

  //void _deleteFavouriteRecipe(int index){
  //  _favouriteRecipes.removeAt(index);
  //  notifyListeners();
  //}

  //void _addFavouriteRecipe(Recipe item){
  //  _favouriteRecipes.add(item);
  //  notifyListeners();
  //}

  //void updateFavouriteList(Recipe item, bool newValue){
  //  if (newValue) {
  //    _addFavouriteRecipe(item);
  //  } else {
  //    final int _favouriteRecipesIndex = _favouriteRecipes.indexWhere((element) => element.name==item.name);
  //    _deleteFavouriteRecipe(_favouriteRecipesIndex);
  //  }
  //}

  //void updateFavouriteValue(Recipe item, bool newValue){
  //  final int _allRecipesIndex = _allRecipes.indexWhere((element) => element.name==item.name);

  //  if (_allRecipesIndex!=-1){
  //    _allRecipes[_allRecipesIndex].isFavourite = newValue;
  //  }
  //  notifyListeners();
  //}

  //static Future<List<Recipe>> getAllRecipes() async {
    // Simulate api request wait time
  //  await Future.delayed(const Duration(milliseconds: 5000));

  //  return List.unmodifiable(SampleData.allRecipes);

 // }

}
