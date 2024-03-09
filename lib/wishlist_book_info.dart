import 'package:booky/book.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:booky/data_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class WishlistBookInfo extends StatefulWidget {
  const WishlistBookInfo({super.key, required this.book});

  final Book book;

  @override
  State<WishlistBookInfo> createState() => _WishlistBookInfoState();
}

class _WishlistBookInfoState extends State<WishlistBookInfo> {
  bool _isStarred = false;
  @override
  void initState() {
    super.initState();
    _isStarred = widget.book.isStarred;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(widget.book.name,
            style: Theme.of(context).textTheme.titleLarge),
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
            icon: Icon(
              Icons.star,
              color: _isStarred
                  ? const Color(0xFFFF4713)
                  : const Color(0xFF58595B),
            ),
            onPressed: () {
              setState(() {
                _isStarred = !_isStarred;
                final dataManager =
                Provider.of<DataManager>(context, listen: false);
                dataManager.updateFavouriteValue(widget.book, _isStarred);
                dataManager.updateFavouriteList(widget.book, _isStarred);
              });
            },
          ),
        ],
      ),
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
                          height:
                          (MediaQuery.of(context).size.width) / 2.1 * 1.51,
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
                                style: Theme.of(context).textTheme.titleLarge,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.author,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: RatingBar.builder(
                                itemSize: 15,
                                initialRating: widget.book.allRating,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color(0xFF141D29),
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            Text(
                              'Genre',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.genre,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              'Publish date',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.publishDate,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              'Pages',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.pages.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
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
                    'ISBN',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                  child: Text(
                    widget.book.isbn.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
                  child: Text(
                    'Book description:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ExpandableText(
                    widget.book.description,
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF58595B)),
                      backgroundColor: const Color(0xFF141d29),
                    ),
                    child: Text(
                      'Add to shelf',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFFDCE2EB),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF58595B)),
                      backgroundColor: const Color(0xFFDCE2EB),
                    ),
                    child: Text(
                      'Buy',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF141d29),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
