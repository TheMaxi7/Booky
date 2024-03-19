import 'package:booky/dashboard/challenges_card.dart';
import 'package:booky/dashboard/edit_challenge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_and_classes/data_manager.dart';

class DashboardChallengesTab extends StatefulWidget {
  const DashboardChallengesTab({super.key});

  @override
  State<DashboardChallengesTab> createState() => _DashboardChallengesTabState();
}

class _DashboardChallengesTabState extends State<DashboardChallengesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Monthly Challenge",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      iconSize: 22,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditChallenge(
                                    challenge:
                                    manager.allStandardChallenges[0]))); },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: LinearProgressIndicator(
                        value: manager.allStandardChallenges[0].progress /
                            manager.allStandardChallenges[0].booksToRead,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: const Color(0xFF141D29),
                        color: const Color(0xFFFF4713),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${((manager.allStandardChallenges[0].progress / manager.allStandardChallenges[0].booksToRead) * 100).toInt()}%",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 16),
                  child: Row(

                    children: [
                      const Icon(Icons.book),
                      Text(
                        '${manager.allStandardChallenges[0].progress} / ${manager.allStandardChallenges[0].booksToRead}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yearly Challenge",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                        icon: const Icon(Icons.edit),
                        iconSize: 22,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditChallenge(
                                    challenge:
                                    manager.allStandardChallenges[1]))); },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: LinearProgressIndicator(
                        value: manager.allStandardChallenges[1].progress /
                            manager.allStandardChallenges[1].booksToRead,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: const Color(0xFF141D29),
                        color: const Color(0xFFFF4713),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${((manager.allStandardChallenges[1].progress / manager.allStandardChallenges[1].booksToRead) * 100).toInt()}%",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.book),
                      Text(
                        '${manager.allStandardChallenges[1].progress} / ${manager.allStandardChallenges[1].booksToRead}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  )),
              const Divider(thickness: 0, color: Color(0xFF141D29)),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: manager.allChallenges.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ChallengeCard(
                      challenge: manager.allChallenges[index],
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
