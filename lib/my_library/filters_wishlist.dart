import 'package:booky/data_and_classes/book.dart';
import 'package:booky/my_library/filtered_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:booky/data_and_classes/data_manager.dart';
import 'package:provider/provider.dart';

class FiltersWishlist extends StatefulWidget {
  const FiltersWishlist({super.key});

  @override
  State<FiltersWishlist> createState() => _FiltersWishlistState();
}

class _FiltersWishlistState extends State<FiltersWishlist> {
  final DataManager manager = DataManager();
  int _selectedGenreIndex = -1;
  late List<Book> filteredBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Filters",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: manager.myWishlist.length,
              itemBuilder: (BuildContext context, int index) {
                var genres = manager.myWishlist[index].genre;
                return RadioListTile(
                  title: Text(genres),
                  value: index,
                  groupValue: _selectedGenreIndex,
                  onChanged: (int? value) {
                    setState(() {
                      _selectedGenreIndex = value!;
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: ((MediaQuery.of(context).size.width) / 1.5),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedGenreIndex != -1) {
                  setState(() {
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    filteredBooks = dataManager.filterWishlist(
                        manager.myWishlist[_selectedGenreIndex].genre);
                  });
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilteredWishlist(
                              filteredWishlist: filteredBooks,
                            )));
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.black,
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(0xFF141D29),
              ),
              child: Text(
                'Filter',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFDCE2EB),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
