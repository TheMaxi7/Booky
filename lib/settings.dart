import 'package:booky/data_manager.dart';
import 'package:booky/languages_list.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

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
            title: const Text("Language"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LanguagesList()));
            },
          ),
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
            title: const Text("Delete data"),
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
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFDCE2EB),
          surfaceTintColor: Colors.transparent,
          title: const Text('Confirm Delete'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete all your data?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:  Text('No',style: Theme.of(context).textTheme.bodyMedium,),
            ),
            TextButton(
              onPressed: () {
                manager.deleteAllData();
                Navigator.of(context).pop();
              },
              child:  Text('Yes',style: Theme.of(context).textTheme.bodyMedium,),
            ),
          ],
        );
      },
    );
  }
}
