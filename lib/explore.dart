import 'package:booky/category_books.dart';
import 'package:booky/explore_book_card.dart';
import 'package:booky/explore_book_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class Explore extends StatefulWidget {
  const Explore({
    Key? key,
  }) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final DataManager dataManager = DataManager();
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        manager.findAllGenres();
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(40),
                      surfaceTintColor: const Color(0xFFDCE2EB),
                      color: const Color(0xFFDCE2EB),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF58595B)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: const Color(0xFFDCE2EB),
                            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF58595B)),
                            hint: const Text("All categories", style: TextStyle(color: Color(0xFF58595B))),
                            items: manager.genres.map<DropdownMenuItem<String>>((String genre) {
                              return DropdownMenuItem<String>(
                                value: genre,
                                child: Text(genre, style: const TextStyle(color: Color(0xFF58595B))),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CategoryBooksGrid(genre: value)),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text("Bestsellers",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: (MediaQuery.of(context).size.width)/3*1.8,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.bestsellersBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ExploreBookInfo(
                                      book: manager.bestsellersBooks[index]);
                                },
                              ),
                            );
                          },
                          child: ExploreBookCard(
                              book: manager.bestsellersBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New releases",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: (MediaQuery.of(context).size.width)/3*1.8,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.newReleasesBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ExploreBookInfo(
                                      book: manager.newReleasesBooks[index]);
                                },
                              ),
                            );
                          },
                          child: ExploreBookCard(
                              book: manager.newReleasesBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("For you",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: (MediaQuery.of(context).size.width)/3*1.8,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8),
                      itemCount: manager.forYouBooks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ExploreBookInfo(
                                      book: manager.forYouBooks[index]);
                                },
                              ),
                            );
                          },
                          child:
                              ExploreBookCard(book: manager.forYouBooks[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
