import 'package:booky/data_and_classes/book.dart';
import 'package:booky/explore/explore_book_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_and_classes/data_manager.dart';

class CategoryBooksGrid extends StatefulWidget {
  const CategoryBooksGrid({super.key, required this.genre});

  final String genre;

  @override
  State<CategoryBooksGrid> createState() => _CategoryBooksGridState();
}

class _CategoryBooksGridState extends State<CategoryBooksGrid> {
  final DataManager dataManager = DataManager();
  late List<Book> booksInCategory;

  @override
  Widget build(BuildContext context) {
    booksInCategory = dataManager.findBooksOfGenre(widget.genre);
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFDCE2EB),
            title: Text(
              "Category: ${widget.genre}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.40,
                  ),
                  itemCount: booksInCategory.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExploreBookInfo(
                                    book: booksInCategory[index])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(booksInCategory[index].cover),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
