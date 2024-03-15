import 'package:booky/challenges.dart';
import 'package:booky/note.dart';
import 'package:booky/quote.dart';
import 'package:booky/shelf.dart';
import 'package:booky/standard_challenges.dart';
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
  final List<StandardChallenge> _standardChallenges =
      SampleData.allStandardChallenges;

  List<Book> get allBooks => List.unmodifiable(_allBooks);

  List<Book> get bestsellersBooks => List.unmodifiable(_bestsellersBooks);

  List<Book> get forYouBooks => List.unmodifiable(_forYouBooks);

  List<Book> get newReleasesBooks => List.unmodifiable(_newReleasesBooks);

  List<Book> get myBooks => List.unmodifiable(_myBooks);

  List<Book> get myWishlist => List.from(_myWishlist);

  List<Challenge> get allChallenges => List.from(_challenges);

  List<Shelf> get myShelves => List.from(_myShelves);

  List<StandardChallenge> get allStandardChallenges =>
      List.from(_standardChallenges);

  void updateChallenge(StandardChallenge challenge, int progress, int newGoal) {
    challenge.progress = progress;
    challenge.booksToRead = newGoal;
    notifyListeners();
  }

  void updateBookInfo(Book book, String newTitle, String newAuthor,
      Shelf oldShelf, Shelf newShelf, int newProgress, double newMyRate) {
    book.name = newTitle;
    book.author = newAuthor;
    removeBookFromShelf(book, oldShelf);
    addBookToShelf(book, newShelf);
    book.pagesRead = newProgress;
    book.myRating = newMyRate;
    notifyListeners();
  }

  void addBookManually(String title, String author, String genre, int pages,
      int isbn, Shelf shelf, String description) {
    Book newBook = Book();
    newBook.cover = 'assets/images/deepwork.jpg';
    newBook.name = title;
    newBook.author = author;
    newBook.genre = genre;
    newBook.pages = pages;
    newBook.isbn = isbn;
    newBook.description = description;
    addBookToShelf(newBook, shelf);
    addBookToMyBooks(newBook);
  }

  void addBookToShelf(Book item, Shelf shelf) {
    shelf.books.add(item);
    notifyListeners();
  }

  void removeBookFromShelf(Book item, Shelf shelf) {
    shelf.books.remove(item);
    notifyListeners();
  }

  void addBookToMyBooks(Book item) {
    _myBooks.add(item);
    notifyListeners();
  }

  void removeBookFromMyBooks(Book item) {
    _myBooks.remove(item);
    for (int i = 0; i < myShelves.length; i++) {
      for (int j = 0; j < myShelves[i].books.length; j++) {
        if (myShelves[i].books[j] == item) {
          myShelves[i].books.remove(item);
        }
      }
    }
    notifyListeners();
  }

  void updateMyBooksList(Book book, bool action) {
    if (action == false) {
      addBookToMyBooks(book);
    } else {
      removeBookFromMyBooks(book);
    }
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
    final int allBooksIndex =
        allBooks.indexWhere((element) => element.name == item.name);

    if (allBooksIndex != -1) {
      allBooks[allBooksIndex].isStarred = newValue;
      notifyListeners();
    }
  }


  void addQuoteToBook(Quote quote, Book book){
    book.quotes.add(quote);
    notifyListeners();
  }
  void addNewQuote(Book book, String title, String noteContent, int pageNumber, bool setFavourite) {
    Quote newQuote = Quote();
    newQuote.name = title;
    newQuote.index = book.quotes.length+1;
    newQuote.quote = noteContent;
    newQuote.page = pageNumber;
    newQuote.favourite=setFavourite;
    addQuoteToBook(newQuote, book);
    notifyListeners();
  }

  void addNoteToBook(Note note, Book book){
    book.notes.add(note);
    notifyListeners();
  }
  void addNewNote(Book book, String title, String noteContent, int pageNumber) {
    Note newNote = Note();
    newNote.name = title;
    newNote.index = book.notes.length+1;
    newNote.note = noteContent;
    newNote.page = pageNumber;
    addNoteToBook(newNote, book);
    notifyListeners();
  }

  void updateNote(Note note, String name, String content, int page) {
    note.name=name;
    note.note=content;
    note.page=page;
    notifyListeners();
  }

  void updateQuote(Quote quote, String name, String content, int page) {
    quote.name=name;
    quote.quote=content;
    quote.page=page;
    notifyListeners();
  }
}
