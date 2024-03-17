import 'package:booky/export.dart';
import 'package:booky/import.dart';
import 'package:flutter/material.dart';

class ImportExport extends StatefulWidget {
  const ImportExport({Key? key}) : super(key: key);

  @override
  State<ImportExport> createState() => _ImportExportState();
}

class _ImportExportState extends State<ImportExport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Import/Export",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          title: const Text("Import"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Import()));
          },
        ),
        ListTile(
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          title: const Text("Export"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Export()));
          },
        ),
      ]),
    );
  }
}
