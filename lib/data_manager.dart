import 'package:booky/challenges.dart';
import 'package:booky/shelf.dart';
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
  final List<Challenge> _challenges = SampleData.allChallenges;
  final List<Shelf> _myShelves = SampleData.myShelves;



  List<Book> get allBooks => List.unmodifiable(_allBooks);
  List<Book> get bestsellersBooks => List.unmodifiable(_bestsellersBooks);
  List<Book> get forYouBooks => List.unmodifiable(_forYouBooks);
  List<Book> get newReleasesBooks => List.unmodifiable(_newReleasesBooks);
  List<Book> get myBooks => List.unmodifiable(_myBooks);
  List<Book> get myWishlist => List.from(_myWishlist);
  List<Challenge> get allChallenges => List.from(_challenges);
  List<Shelf> get myShelves => List.from(_myShelves);


  void addBookToShelf(Book item, Shelf shelf) {
    shelf.books.add(item);
    notifyListeners();
  }

  void removeBookFromShelf(Book item, Shelf shelf) {
    shelf.books.remove(item);
    notifyListeners();
  }

  void addNewShelf(Shelf shelf) {
    _myShelves.add(shelf);
    notifyListeners();
  }

  void removeShelf(Shelf shelf) {
    _myShelves.remove(shelf);
    notifyListeners();
  }

  void updateShelfList(Shelf shelf, bool action) {
    if (action == false) {
      addNewShelf(shelf);
    } else {
      removeShelf(shelf);
    }
    notifyListeners();
    }


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
    final int allBooksIndex = allBooks.indexWhere((element) => element.name == item.name);

    if (allBooksIndex != -1) {
      allBooks[allBooksIndex].isStarred = newValue;
      notifyListeners();
    }
  }


  //static Future<List<Recipe>> getAllRecipes() async {
    // Simulate api request wait time
  //  await Future.delayed(const Duration(milliseconds: 5000));

  //  return List.unmodifiable(SampleData.allRecipes);

 // }

}
