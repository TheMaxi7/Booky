import 'package:flutter/material.dart';
import 'package:booky/base_elements/base_scaffold.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScaffold(
      appBar: AppBar(
        title: const Text("Dashboard",style: TextStyle(color: Color(0xFF141D29))),
        elevation: 4.0,
        backgroundColor: const Color(0xFFDCE2EB),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );

  }

}