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
  List<Book> get myWishlist => List.from(_myWishlist);


  void _removeBookFromWishlist(Book item) {

    _myWishlist.remove(item);
    notifyListeners();
  }

  void _addBookToWishlist(Book item) {

    _myWishlist.add(item);
    notifyListeners();
  }

  void updateFavouriteList(Book item, bool newValue) {
    if (newValue) {
      _addBookToWishlist(item);
    } else {
      _removeBookFromWishlist(item);
    }
    notifyListeners();
  }

  void updateFavouriteValue(Book item, bool newValue) {
    final int _allBooksIndex = allBooks.indexWhere((element) => element.name == item.name);

    if (_allBooksIndex != -1) {
      allBooks[_allBooksIndex].isStarred = newValue;
      notifyListeners();
    }
  }


  //static Future<List<Recipe>> getAllRecipes() async {
    // Simulate api request wait time
  //  await Future.delayed(const Duration(milliseconds: 5000));

  //  return List.unmodifiable(SampleData.allRecipes);

 // }

}
