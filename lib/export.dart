import 'package:flutter/material.dart';

class Export extends StatefulWidget {
  const Export({Key? key}) : super(key: key);

  @override
  State<Export> createState() => _ExportState();
}

class _ExportState extends State<Export> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB),
        title: Text(
          "Export",
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
                const Icon(Icons.download, size: 100,),
                OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58595B)),
                    backgroundColor: const Color(0xFFDCE2EB),
                  ),
                  child:  Text(
                    "Download CSV",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF141d29),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}