import 'package:booky/book.dart';
import 'package:booky/my_book_card.dart';
import 'package:booky/wishlist_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class SearchInWishlist extends StatefulWidget {
  const SearchInWishlist({Key? key, required this.searchList,required this.searchString}) : super(key: key);
  final List<Book> searchList;
  final String searchString;
  @override
  State<SearchInWishlist> createState() => _SearchInWishlistState();
}

class _SearchInWishlistState extends State<SearchInWishlist> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text("Search results for \"${widget.searchString}\"",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: WishlistBookCard(book: widget.searchList[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: widget.searchList.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
