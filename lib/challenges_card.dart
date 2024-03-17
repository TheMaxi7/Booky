import 'package:booky/challenges.dart';
import 'package:booky/data_manager.dart';
import 'package:flutter/material.dart';

class ChallengeCard extends StatefulWidget {
  const ChallengeCard({Key? key, required this.challenge}) : super(key: key);

  final Challenge challenge;

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  final DataManager manager = DataManager();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color(0xFFDCE2EB),
                      surfaceTintColor: Colors.transparent,
                      title: Text(
                        widget.challenge.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      content: Text(
                        widget.challenge.info,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal, color: const Color(0xFF58595B)),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:  Text(
                            'Close',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Card(
                color: const Color(0xFFDCE2EB),
                elevation: 0,
                surfaceTintColor: const Color(0xFFDCE2EB),
                child: Icon(
                  widget.challenge.trophy,
                  color: manager.myAchievements.contains(widget.challenge) ? const Color(0xFFFF4713) : const Color(0xFF141D29),
                  size: (MediaQuery.of(context).size.width/8),
                ),
              ),
            ),
            Text(
              widget.challenge.name,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
