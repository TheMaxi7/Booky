import 'package:flutter/material.dart';
import 'package:booky/book.dart';

class MyBookCardNotes extends StatefulWidget{
  const MyBookCardNotes({super.key, required this.book});

  final Book book;

  @override
  State<MyBookCardNotes> createState() => _MyBookCardNotesState();

}

class _MyBookCardNotesState extends State<MyBookCardNotes> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 0),
            child: Container(
              width: (MediaQuery.of(context).size.width) /3,
              height: (MediaQuery.of(context).size.width)/3*1.51,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5) ,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 3), // Offset
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(widget.book.cover),
                ),
              ),
            ),
          ),
          SizedBox(width: (MediaQuery.of(context).size.width)/15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(
                    widget.book.name, style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Text(
                  widget.book.author,style: Theme.of(context).textTheme.headlineSmall,

                ),
                Text(
                  'Genre: ${widget.book.genre}',style: Theme.of(context).textTheme.bodyMedium,

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