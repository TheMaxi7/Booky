import 'package:booky/challenges.dart';
import 'package:booky/challenges_card.dart';
import 'package:flutter/material.dart';
import 'package:booky/book.dart';
import 'package:booky/book_info.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/explore_book_card.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final DataManager manager = DataManager();
  late List<Book> myTopRatedBooks;
  late List<Challenge> myAchievements;

  @override
  void initState() {
    super.initState();
    myAchievements = manager.myAchievements;
  }

  @override
  Widget build(BuildContext context) {
    myTopRatedBooks = manager.findMyTopRatedBooks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Personal profile",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                  Icon(
                    Icons.person,
                    size: 150,
                  ),

                  ),
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) / 6,
            child: GridView.builder(
              physics: manager.myAchievements.length > 3 ? null : const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount:  manager.myAchievements.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ChallengeCard(
                  challenge: manager.myAchievements[index],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              "Top 5 Rated books",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),

          SizedBox(
            height: (MediaQuery.of(context).size.width) / 3 * 1.8,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemCount: myTopRatedBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BookInfo(book: myTopRatedBooks[index]);
                        },
                      ),
                    );
                  },
                  child: ExploreBookCard(book: myTopRatedBooks[index]),
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
    );
  }
}
