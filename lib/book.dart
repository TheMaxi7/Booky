import 'quote.dart';
import 'note.dart';


class Book {
  String name = "";
  String cover = "";
  String author="";
  String description = "";
  String genre = "";
  int pages = 0;
  List<Quote> quotes = [];
  List<Note> notes = [];


  Book({
    this.name = "",
    this.author="",
    this.cover = "",
    this.description = "",
    this.pages = 0,
    this.genre="",
    this.quotes = const [],
    this.notes = const [],
  });

}