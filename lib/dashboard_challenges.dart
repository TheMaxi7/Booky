
import 'package:booky/challenges_card.dart';
import 'package:booky/edit_challenge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_manager.dart';

class DashboardChallengesTab extends StatefulWidget {
  const DashboardChallengesTab({Key? key}) : super(key: key);

  @override
  State<DashboardChallengesTab> createState() => _DashboardChallengesTabState();
}

class _DashboardChallengesTabState extends State<DashboardChallengesTab> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(
      builder: (context, manager, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Monthly Challenge"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditChallenge(challenge:manager.allStandardChallenges[0])));
                    },
                    child: Text(
                      "edit",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
                      value: manager.allStandardChallenges[0].progress / manager.allStandardChallenges[0].booksToRead,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: const Color(0xFF141D29),
                      color: const Color(0xFFFF4713),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${((manager.allStandardChallenges[0].progress / manager.allStandardChallenges[0].booksToRead)*100).toInt()}%",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
             Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 16),
                child: Row(
                  children: [const Icon(Icons.book), Text('${manager.allStandardChallenges[0].progress} / ${manager.allStandardChallenges[0].booksToRead}')],
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Yearly Challenge"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditChallenge(challenge:manager.allStandardChallenges[1])));
                    },
                    child: Text(
                      "edit",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
                      value: manager.allStandardChallenges[1].progress / manager.allStandardChallenges[1].booksToRead,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: const Color(0xFF141D29),
                      color: const Color(0xFFFF4713),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${((manager.allStandardChallenges[1].progress / manager.allStandardChallenges[1].booksToRead)*100).toInt()}%",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child:
                Row(
                  children: [
                    const Icon(Icons.book),
                    Text('${manager.allStandardChallenges[1].progress} / ${manager.allStandardChallenges[1].booksToRead}')
                  ],
                )
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: manager.allChallenges.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
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
        );
      },
    );
  }
}
