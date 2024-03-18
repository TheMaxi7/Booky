import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/my_library/filters_wishlist.dart';
import 'package:booky/my_library/wishlist_book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyLibraryWishlist extends StatefulWidget {
  const MyLibraryWishlist({super.key});

  @override
  State<MyLibraryWishlist> createState() => _MyLibraryWishlistState();
}

class _MyLibraryWishlistState extends State<MyLibraryWishlist> {
  late bool _sortAscending;

  @override
  void initState() {
    super.initState();
    _sortAscending = true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FiltersWishlist()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF58595B)),
                      ),
                      icon: const Icon(Icons.filter_alt_sharp,
                          color: Color(0xFF58595B)),
                      label: Text(
                        'Filter',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          final dataManager =
                              Provider.of<DataManager>(context, listen: false);
                          _sortAscending = !_sortAscending;
                          if (_sortAscending) {
                            dataManager.sortWishlistAZ();
                          } else {
                            dataManager.sortWishlistZA();
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF58595B)),
                      ),
                      icon: const Icon(Icons.sort, color: Color(0xFF58595B)),
                      label: Text(
                        _sortAscending ? 'Sort A-Z' : 'Sort Z-A',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              final bookIndex = index - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: WishlistBookCard(book: manager.myWishlist[bookIndex]),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: manager.myWishlist.length + 1,
        );
      },
    );
  }
}
