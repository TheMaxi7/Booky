import 'package:flutter/material.dart';
import 'package:booky/book.dart';
import 'package:booky/sample_data.dart';

class DataManager extends ChangeNotifier {

  final List<Book> _allBooks = SampleData.allBooks;
  final List<Book> _bestsellersBooks = SampleData.bestsellersBooks;
  final List<Book> _forYouBooks = SampleData.forYouBooks;
  final List<Book> _newReleasesBooks = SampleData.newReleasesBooks;
  final List<Book> _myBooks = SampleData.myBooks;
  final List<Book> _myWishlist = SampleData.myWishlist;


  List<Book> get allBooks => List.unmodifiable(_allBooks);
  List<Book> get bestsellersBooks => List.unmodifiable(_bestsellersBooks);
  List<Book> get forYouBooks => List.unmodifiable(_forYouBooks);
  List<Book> get newReleasesBooks => List.unmodifiable(_newReleasesBooks);
  List<Book> get myBooks => List.unmodifiable(_myBooks);
  List<Book> get myWishlist => List.unmodifiable(_myWishlist);


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
