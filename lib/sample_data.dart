import 'quote.dart';
import 'note.dart';
import 'book.dart';


class SampleData {
  static Book book1 = Book(
    name : "Deep Work",
    cover : "assets/deepwork.jpg",
    description : "Deep work it what yohnot ay.",
    pages : 296,
    genre : "Self Help",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );


  static Book book2 = Book(
    name : "Atomic Habits",
    cover : "assets/atomichabits.jpg",
    description : "lorem",
    pages : 296,
    genre : "Self Help",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );


  static Book book3 = Book(
    name : "Quiet",
    cover : "assets/quiet.jpg",
    description : "lorem",
    pages : 296,
    genre : "Psychology",
    quotes : [
      Quote(
        index: 1,
        quote: "If you can’t learn, you can’t thrive.",
        page: 111,
        favourite: true,
      )
    ],
    notes : [
      Note(
        index:1,
        note:"lorem",
        page:111,
      ),
    ],
  );


  static List<Book> allBooks = [
    book1,
    book2,
    book3
  ];
}