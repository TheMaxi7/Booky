import 'quote.dart';
import 'note.dart';


class Book {
  String name = "";
  String cover = "";
  String author="";
  double myRating;
  double allRating;
  String publishDate="";
  int isbn;
  String amazonUrl="";
  String infoUrl="";
  String description = "";
  String genre = "";
  bool isStarred = false;
  int pagesRead = 0;
  int pages = 0;
  List<Quote> quotes = [];
  List<Note> notes = [];


  Book({
    this.name = "",
    this.author="",
    this.isbn=0,
    this.amazonUrl="",
    this.infoUrl="",
    this.cover = "",
    this.publishDate="",
    this.myRating = 0.0,
    this.allRating =0.0,
    this.isStarred = false,
    this.description = "",
    this.pages = 0,
    this.pagesRead =0,
    this.genre="",
    this.quotes = const [],
    this.notes = const [],
  });

}