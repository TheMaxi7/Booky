import 'package:booky/book_info.dart';
import 'package:booky/challenges_card.dart';
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
            const Padding(
              padding: EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Monthly Challenge"),
                  Text("edit"),
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
                      value: 0.2,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: const Color(0xFF141D29),
                      color: const Color(0xFFFF4713),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "20%",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 16),
                child: Row(
                  children: [Icon(Icons.book), Text('4/12')],
                )),
            const Padding(
              padding: EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Yearly Challenge"),
                  Text("edit"),
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
                      value: 0.2,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: const Color(0xFF141D29),
                      color: const Color(0xFFFF4713),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "20%",
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  children: [Icon(Icons.book), Text('4/12')],
                )),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: manager.allChallenges.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0, // Aspect ratio for each grid item
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
