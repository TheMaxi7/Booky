import 'package:booky/book_info.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/notes_book_card.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:booky/book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MyBookCard extends StatefulWidget {
  const MyBookCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<MyBookCard> createState() => _MyBookCardState();
}

class _MyBookCardState extends State<MyBookCard> {
  final DataManager manager = DataManager();


  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              GestureDetector(
                onLongPressStart: (value) {
                  _showDeleteBookButton(context, value.globalPosition, widget.book);
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookInfo(book: widget.book),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, bottom: 8, right: 0),
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
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(
                                widget.book.name,
                                style:
                                    GoogleFonts.exo(),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: (){
                            Share.share('check out this book: ${widget.book.infoUrl}\n\nSent by Booky');},
                          ),
                        ],
                      ),
                      Text(
                        widget.book.author,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        'Shelf: ${findShelf(widget.book)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        children: [
                          Stack(
                            children: [
                              if ((widget.book.pagesRead / widget.book.pages) <
                                  1.0)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 8),
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width) / 2.5,
                                    height: 3,
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10),
                                      value: (widget.book.pagesRead /
                                          widget.book.pages),
                                      backgroundColor: const Color(0xFF141D29),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Color(0xFFFF4713)),
                                    ),
                                  ),
                                ),
                              if ((widget.book.pagesRead / widget.book.pages) >= 1.0)
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, right: 8),
                                  child: Icon(
                                    Icons.check,
                                    color: Color(0xFF141D29),
                                    size: 20,
                                  ),
                                ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                ((widget.book.pagesRead / widget.book.pages) * 100).toInt() != 100
                                    ? '${((widget.book.pagesRead / widget.book.pages) * 100).toInt()}%'
                                    : 'Finished',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width) / 2,
                        child: ExpandableText(
                          '"${findPinnedQuote(widget.book)}"',
                          style: Theme.of(context).textTheme.bodyMedium,
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 2,
                        ),
                      ),
                    ]),
              )
            ]
        )
    );
  }

  void _showDeleteBookButton(BuildContext context, Offset offset, Book book) {
    final RenderObject overlay =
    Overlay.of(context).context.findRenderObject()!;

    showMenu(
        context: context,
        items: [
          PopupMenuItem(
            child: const Row(children: [
              Icon(Icons.delete),
              SizedBox(width: 16),
              Text('Delete')
            ]),
            onTap: () {
              setState(() {
                final dataManager =
                Provider.of<DataManager>(context, listen: false);
                dataManager.updateMyBooksList(
                    book, true);
              });
            },
          ),
        ],
        position: RelativeRect.fromRect(
            Rect.fromLTWH(offset.dx, offset.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay.paintBounds.size.width,
                overlay.paintBounds.size.height)));
  }

  String findShelf (Book book) {
    String shelfFound = "No shelf";
    for (int i = 0; i < manager.myShelves.length; i++) {
      for (int j = 0; j < manager.myShelves[i].books.length; j++) {
        if (manager.myShelves[i].books[j] == book) {
          shelfFound = manager.myShelves[i].name;
          break;
        }

      }
    }
    return shelfFound;
  }

  void _onShare(BuildContext context, String url) async {
    String uri = 'Check%this%book%out:$url';
    if (uri.isNotEmpty) {
      await Share.shareUri(Uri.parse(uri));
    }
  }

}
