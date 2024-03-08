import 'package:booky/book.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class WishlistBookInfo extends StatefulWidget {
  const WishlistBookInfo({super.key, required this.book});

  final Book book;

  @override
  State<WishlistBookInfo> createState() => _WishlistBookInfoState();
}

class _WishlistBookInfoState extends State<WishlistBookInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text(widget.book.name,
              style: const TextStyle(color: Color(0xFF141D29))),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.share,
                color: Color(0xFF58595B),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.add_alert_rounded,
                color: Color(0xFF58595B),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.star,
                color: Color(0xFF58595B),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            Card(
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 8, bottom: 8, right: 0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 2.3,
                      height: (MediaQuery.of(context).size.width) / 2.3 * 1.51,
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
                  SizedBox(width: (MediaQuery.of(context).size.width) / 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Text(
                            widget.book.name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
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
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Text('Book description:'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: ExpandableText(
                widget.book.description,
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141d29),
                    fixedSize:
                    Size((MediaQuery.of(context).size.width) / 2.2, 10),
                  ),
                  child: Text('Add to shelf',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFFDCE2EB))),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFFDCE2EB),
                    fixedSize:
                    Size((MediaQuery.of(context).size.width) / 2.2, 10),
                  ),
                  child:
                  Text('Buy', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFF141d29) )),
                ),
              ],
            ),
          ],
        ));
  }
}
