import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget{
  const BaseScaffold({super.key});


  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text("My Library"),
        backgroundColor: Colors.amber,
      ),
      drawer:  Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: Container(
                  height: 40,
                  color:Colors.blue,
                ),
            ),
            const Text("Child1"),
            const Divider(),
            const Text("Child2"),
          ],
        ),
      ),
    );
  }
}