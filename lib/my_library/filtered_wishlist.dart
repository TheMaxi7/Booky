import 'package:booky/data_and_classes/book.dart';
import 'package:booky/my_library/wishlist_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_and_classes/data_manager.dart';

class FilteredWishlist extends StatefulWidget {
  const FilteredWishlist({super.key, required this.filteredWishlist});

  final List<Book> filteredWishlist;

  @override
  State<FilteredWishlist> createState() => _FilteredWishlistState();
}

class _FilteredWishlistState extends State<FilteredWishlist> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, manager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text("Filtered books",
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
                    child:
                        WishlistBookCard(book: widget.filteredWishlist[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: widget.filteredWishlist.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
