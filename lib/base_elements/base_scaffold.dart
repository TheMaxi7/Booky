
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget{
  final AppBar appBar;

  const BaseScaffold({Key? key, required this.appBar}) : super(key: key);


  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2EB),
      bottomNavigationBar: BottomNavigationBar(
        elevation:20.0,
        backgroundColor: const Color(0xFFDCE2EB),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF58595B),
        selectedItemColor: const Color(0xFFFF4713),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library_outlined),
              label: "My Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: "Dashboard"),
          BottomNavigationBarItem(
              icon: Icon(Icons.draw),
              label: "Notes"),
        ],
      ),
      appBar: appBar,
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