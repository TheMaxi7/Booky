import 'package:booky/my_library/wishlist_book_info.dart';
import 'package:flutter/material.dart';
import 'package:booky/data_and_classes/book.dart';
import 'package:share_plus/share_plus.dart';

class WishlistBookCard extends StatefulWidget {
  const WishlistBookCard({super.key, required this.book});

  final Book book;

  @override
  State<WishlistBookCard> createState() => _WishlistBookCardState();
}

class _WishlistBookCardState extends State<WishlistBookCard> {
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
                  builder: (context) => WishlistBookInfo(book: widget.book),
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
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        Share.share(
                            'Check out this book: ${widget.book.infoUrl}\n\nSent by Booky');
                      },
                    ),
                  ],
                ),
                Text(
                  widget.book.author,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
                Text(
                  'Genre: ${widget.book.genre}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
                Text(
                  'Pages: ${widget.book.pages.toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
