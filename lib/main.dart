import 'package:booky/app_theme.dart';
import 'package:flutter/material.dart';
import 'my_library.dart';
import 'notes.dart';

void main() {
  runApp(BookyApp());
}

class BookyApp extends StatelessWidget {
  BookyApp({super.key});

  final ThemeData appTheme = BookyTheme.normal();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "",
      home: const DefaultTabController(
        length: 3,
        child: BookyAppHome(title: "My Library"),
      ),
    );
  }
}

class BookyAppHome extends StatefulWidget {
  const BookyAppHome({super.key, required this.title});

  final String title;

  @override
  State<BookyAppHome> createState() => _BookyAppHomeState();
}

class _BookyAppHomeState extends State<BookyAppHome> {
  int _selectedIconIndex = 0;

  final List<Widget> _screens = <Widget>[
    const MyLibrary(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    const Notes(),
  ];

  final List<String> _titles = <String>[
    "My Library",
    "Explore",
    "Dashboard",
    "Notes",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                height: 15,
                color: Colors.blue,
              ),
            ),
            const Text("Child1"),
            const Divider(),
            const Text("Child2"),
          ],
        ),
      ),
      body: _screens[_selectedIconIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
        borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
        ), child: BottomNavigationBar(
        //elevation: 2.0,
        //backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIconIndex,
        onTap: (index) {
          setState(() {
            _selectedIconIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library_outlined),
            label: "My Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_note_sharp),
            label: "Notes",
          ),
        ],
      ),
      ),
      ),
    );
  }
}




//primary: const Color(0xFF141D29),
//secondary: const Color(0xFF58595B),
//background: const Color(0xFFDCE2EB),
//tertiary: const Color(0xFFFF4713)



