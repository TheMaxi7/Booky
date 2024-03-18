import 'package:booky/data_and_classes/data_manager.dart';
import 'package:booky/lateral_drawer/languages_list.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final DataManager manager = DataManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          title: Text(
            "Language",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LanguagesList()));
          },
        ),
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          title: Text(
            "Delete data",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          onTap: () {
            _showDeleteDataConfirmationDialog();
          },
        ),
      ]),
    );
  }

  Future<void> _showDeleteDataConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFDCE2EB),
          surfaceTintColor: Colors.transparent,
          title: Text(
            'Confirm Delete',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to delete all your data?',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF58595B),
                      ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            TextButton(
              onPressed: () {
                manager.deleteAllData();
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
