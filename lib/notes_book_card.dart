
import 'package:booky/notes_book_info.dart';
import 'package:flutter/material.dart';
import 'package:booky/book.dart';

class NotesBookCard extends StatefulWidget {
  const NotesBookCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<NotesBookCard> createState() => _NotesBookCardState();
}

class _NotesBookCardState extends State<NotesBookCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesBookInfo(book: widget.book),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 0),
              child: Container(
                width: (MediaQuery.of(context).size.width) / 3,
                height: (MediaQuery.of(context).size.width) / 3 * 1.51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.book.cover),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: (MediaQuery.of(context).size.width) / 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: SizedBox(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.width) / 5 * 1.51,
                    child: Text(
                      findFavourite(widget.book),
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: (((MediaQuery.of(context).size.width) / 5 * 1.51) / 2) ~/ 10,
                    ),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF58595B)),
                        backgroundColor: const Color(0xFF141d29),
                      ),

                      child: Text('Add note', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFFDCE2EB))),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "View all",
                      style: TextStyle(color: Color(0xFF58595B)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String findFavourite(Book book) {
  String favoriteQuote = "No quote selected";

  for (int i = 0; i < book.quotes.length; i++) {
    if (book.quotes[i].favourite) {
      favoriteQuote = book.quotes[i].quote;
      break;
    }
  }

  return favoriteQuote;
}
