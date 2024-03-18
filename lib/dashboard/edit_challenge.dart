import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/data_and_classes/standard_challenges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditChallenge extends StatefulWidget {
  const EditChallenge({super.key, required this.challenge});

  final StandardChallenge challenge;

  @override
  State<EditChallenge> createState() => _EditChallengeState();
}

class _EditChallengeState extends State<EditChallenge> {
  final DataManager manager = DataManager();
  late int goal;
  late double _value;
  late int _booksRead;
  TextEditingController goalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    goalController.text = widget.challenge.booksToRead.toString();
    _value = widget.challenge.progress.toDouble();
    _booksRead = widget.challenge.progress;
    goal = widget.challenge.booksToRead;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFDCE2EB),
          title: Text(
            "Edit ${widget.challenge.name}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8),
                    child: Text(
                      "Progress",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: widget.challenge.booksToRead.toDouble(),
                    activeColor: const Color(0xFF141D29),
                    inactiveColor: const Color(0xFF58595B),
                    thumbColor: const Color(0xFFFF4713),
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        _booksRead = value.toInt();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Books read: $_booksRead",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Books to read: ${widget.challenge.booksToRead}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 8, bottom: 4),
                    child: Text(
                      "Edit goal",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextField(
                    controller: goalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF141D29)),
                      ),
                      hintText: 'Enter goal',
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF58595B)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          goalController.text = '';
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.of(context).size.width) / 1.5),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    goal = int.tryParse(goalController.text) ?? 0;
                    final dataManager =
                        Provider.of<DataManager>(context, listen: false);
                    dataManager.updateChallenge(
                      widget.challenge,
                      _booksRead,
                      goal,
                    );
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFF141D29)),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFFDCE2EB),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
