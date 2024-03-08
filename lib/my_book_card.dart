import 'package:booky/book_info.dart';
import 'package:flutter/material.dart';
import 'package:booky/book.dart';

class MyBookCard extends StatefulWidget {
  const MyBookCard({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<MyBookCard> createState() => _MyBookCardState();
}

class _MyBookCardState extends State<MyBookCard> {
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
                  builder: (context) => BookInfo(book: widget.book),
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  widget.book.author,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Genre: ${widget.book.genre}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Pages: ${widget.book.pages.toString()}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
