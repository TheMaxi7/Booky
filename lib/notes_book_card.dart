import 'dart:ui';

import 'package:booky/new_note.dart';
import 'package:booky/new_quote.dart';
import 'package:booky/notes_book_info.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:booky/book.dart';
import 'package:share_plus/share_plus.dart';

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
                            "Pinned quote",
                            style:
                            Theme.of(context).textTheme.headlineMedium,
                          ),
                          ExpandableText(
                            "\"${findPinnedQuote(widget.book)}\"",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontStyle: FontStyle.italic),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                          ),
                          Text(
                            "Pinned note",
                            style:
                            Theme.of(context).textTheme.headlineMedium,
                          ),
                          ExpandableText(
                            "\"${findPinnedNote(widget.book)}\"",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontStyle: FontStyle.italic),
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.share,
                          color: Color(0xFF141D29),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'share_quote',
                            child: Text('Share quote'),
                          ),
                          const PopupMenuItem(
                            value: 'share_note',
                            child: Text('Share note'),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'share_quote') {
                            Share.share('Quote from: ${widget.book.name}\n\n"${findPinnedQuote(widget.book)}"\n\nSent by Booky');
                          } else{
                            Share.share('Note from: ${widget.book.name}\n\n${findPinnedNote(widget.book)}\n\nSent by Booky');
                          }
                        },
                      ),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF141D29),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'now_quote',
                            child: Text('New quote'),
                          ),
                          const PopupMenuItem(
                            value: 'new_note',
                            child: Text('New note'),
                          ),
                        ],
                        onSelected: (value) async {
                          if (value == 'new_note') {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewNote(book: widget.book),
                                ));
                          } else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  NewQuote(book: widget.book)));
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

String findPinnedQuote(Book book) {
  String favoriteQuote = "No pinned quote";

  for (int i = 0; i < book.quotes.length; i++) {
    if (book.quotes[i].isPinned) {
      favoriteQuote = book.quotes[i].quote;
      break;
    }
  }

  return favoriteQuote;
}


String findPinnedNote(Book book) {
  String pinnedNote = "No pinned note";

  for (int i = 0; i < book.notes.length; i++) {
    if (book.notes[i].isPinned) {
      pinnedNote = book.notes[i].note;
      break;
    }
  }
  return pinnedNote;
}
