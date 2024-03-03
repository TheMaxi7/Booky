import 'package:flutter/material.dart';
import 'package:booky/book.dart';

class MyBookCard extends StatefulWidget{
  const MyBookCard({super.key, required this.book});

  final Book book;

  @override
  State<MyBookCard> createState() => _MyBookCardState();

}

class _MyBookCardState extends State<MyBookCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFDCE2EB),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width) / 2,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget.book.cover),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(
                    widget.book.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  widget.book.author,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Genre: ${widget.book.genre}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Pages: ${widget.book.pages.toString()}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}