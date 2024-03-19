import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Import extends StatefulWidget {
  const Import({super.key});

  @override
  State<Import> createState() => _ImportState();
}

class _ImportState extends State<Import> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Import",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                const Icon(Icons.upload, size: 100,),
                OutlinedButton(
                  onPressed: _pickFile,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFFDCE2EB),
                  ),
                  child:  Text(
                    "Pick CSV",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF141d29),
                        ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF58595B)),
                backgroundColor: const Color(
                  0xFF141d29,
                ),
              ),
              child: Text(
                'Import',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFDCE2EB), fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(  type: FileType.custom,
    allowedExtensions: ['csv'],);

  if (result != null) {
    File file = File(result.files.single.path!);
  } else {}
}
