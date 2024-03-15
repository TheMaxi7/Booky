import 'dart:ui';

import 'package:booky/notes_book_info.dart';
import 'package:expandable_text/expandable_text.dart';
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
              padding:
                  const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 0),
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
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Favourite quote",
                            style:
                            Theme.of(context).textTheme.headlineMedium,
                          ),
                          ExpandableText(
                            "\"${findFavourite(widget.book)}\"",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontStyle: FontStyle.italic),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 4,
                          ),
                          Text(
                            "Last note",
                            style:
                            Theme.of(context).textTheme.headlineMedium,
                          ),
                          ExpandableText(
                            "\"${findLastNote(widget.book)}\"",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontStyle: FontStyle.italic),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {},
                      ),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF58595B),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'add_book_with_isbn',
                            child: Text('Add Book with ISBN'),
                          ),
                          const PopupMenuItem(
                            value: 'add_by_keyword',
                            child: Text('Add by keyword'),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'add_book_with_isbn') {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SimpleBarcodeScannerPage(),
                                ));
                          } else if (value == 'add_by_keyword') {
                            setState(() {
                              _selectedIconIndex = 1;
                            });
                          } else if (value == 'add_book_manually') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddBookManually()));
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ]),
          )
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

String findLastNote(Book book) {
  String lastNote = "No notes";

    if (book.notes.isNotEmpty) {
      lastNote = book.notes[book.notes.length-1].note;
    }
  return lastNote;
}
