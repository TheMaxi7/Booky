import 'package:booky/book.dart';
import 'package:booky/set_price_alert.dart';
import 'package:booky/shelves_list.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:booky/data_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreBookInfo extends StatefulWidget {
  const ExploreBookInfo({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  State<ExploreBookInfo> createState() => _ExploreBookInfoState();
}

class _ExploreBookInfoState extends State<ExploreBookInfo> {
  bool _isStarred = false;
  late Uri _url = Uri();

  @override
  void initState() {
    super.initState();
    _isStarred = widget.book.isStarred;
    _url = Uri.parse(widget.book.amazonUrl);
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
            onPressed: () {
              Share.share(
                  'Check out this book: ${widget.book.infoUrl}\n\nSent by Booky');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.add_alert_rounded,
              color: Color(0xFF58595B),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SetPriceAlert()),
              );
            },
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
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: RatingBar.builder(
                                itemSize: 15,
                                ignoreGestures: true,
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
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.genre,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                            Text(
                              'Publish date',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.publishDate,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                            Text(
                              'Pages',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                widget.book.pages.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal, color: const Color(0xFF58595B)),
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
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
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShelvesList(book: widget.book),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF58595B)),
                      backgroundColor: const Color(0xFF141d29),
                    ),
                    child: Text(
                      'Add to shelf',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFDCE2EB), fontWeight: FontWeight.w700
                          ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _launchUrl,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF58595B), width: 2,),
                      backgroundColor: const Color(0xFFDCE2EB),
                    ),
                    child: Text(
                      'Buy',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF141d29), fontWeight: FontWeight.w700
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
