import 'package:booky/data_and_classes/book.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/my_library/edit_book.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({super.key, required this.book});

  final Book book;

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  final DataManager manager = DataManager();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFDCE2EB),
            title: Text(widget.book.name,
                style: Theme.of(context).textTheme.titleLarge),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.mode_edit,
                  color: Color(0xFF58595B),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditBook(
                              book: widget.book,
                            )),
                  );
                },
              ),
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    elevation: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 8, bottom: 0, right: 0),
                          child: Container(
                            width: (MediaQuery.of(context).size.width) / 2.1,
                            height: (MediaQuery.of(context).size.width) /
                                2.1 *
                                1.51,
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
                        SizedBox(
                            width: (MediaQuery.of(context).size.width) / 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                child: Text(
                                  widget.book.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  widget.book.author,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                              ),
                              Text(
                                'Genre',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  widget.book.genre,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                              ),
                              Text(
                                'Publish date',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  widget.book.publishDate,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                ),
                              ),
                              Text(
                                'Pages',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  widget.book.pages.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          color: const Color(0xFF58595B)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'My rating',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 4),
                    child: RatingBar.builder(
                      itemSize: 15,
                      ignoreGestures: true,
                      initialRating: widget.book.myRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xFF141D29),
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'Progress',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 8, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: LinearProgressIndicator(
                            value: widget.book.pagesRead / widget.book.pages,
                            borderRadius: BorderRadius.circular(10),
                            backgroundColor: const Color(0xFF141D29),
                            color: const Color(0xFFFF4713),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${((widget.book.pagesRead / widget.book.pages) * 100).toInt()}%",
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'Shelf',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 4),
                    child: Text(
                      findShelf(widget.book),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'ISBN',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      widget.book.isbn.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                    child: Text(
                      'Book description:',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ExpandableText(
                      widget.book.description,
                      expandText: 'show more',
                      collapseText: 'show less',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  String findShelf(Book book) {
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
}
