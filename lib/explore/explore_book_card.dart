import 'package:booky/data_and_classes/book.dart';
import 'package:flutter/material.dart';


class ExploreBookCard extends StatefulWidget {
  final Book book;

  const ExploreBookCard({super.key, required this.book});

  @override
  State<ExploreBookCard> createState() {
    return _ExploreBookCardState();
  }
}

class _ExploreBookCardState extends State<ExploreBookCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(
              width: (MediaQuery.of(context).size.width) /3,
              height: (MediaQuery.of(context).size.width)/3*1.51
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5) ,
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
      ],
    );
  }
}
