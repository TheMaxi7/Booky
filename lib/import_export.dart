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
      body: const Column(
      ),
    );
  }
}
