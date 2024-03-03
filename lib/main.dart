import 'package:flutter/material.dart';
import 'book_column.dart';
import 'package:booky/book.dart';
void main() {
  runApp(const BookyApp());
}

class BookyApp extends StatelessWidget{
  const BookyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      home: BookyAppHome(title:"My Library"),

      );
  }

}

class BookyAppHome extends StatefulWidget{

  const BookyAppHome({super.key, required this.title});

  final String title;
  @override
  State<BookyAppHome> createState() => _BookyAppHomeState();

}

class _BookyAppHomeState extends State<BookyAppHome>{

  int _selectedIconIndex=0;

  final List<Widget> _screens = <Widget>[
    const BookColumn(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
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
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCE2EB) ,
        title: Text(_titles[_selectedIconIndex],style: TextStyle(color: Color(0xFF141D29))),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer:  Drawer(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                height: 15,
                color:Colors.blue,
              ),
            ),
            const Text("Child1"),
            const Divider(),
            const Text("Child2"),
          ],
        ),
      ),
      body: IndexedStack(
        index:_selectedIconIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIconIndex,
        onTap: (index){
          setState(() {
            _selectedIconIndex=index;
          });
        },
        backgroundColor: const Color(0xFFDCE2EB),
        selectedItemColor:  const Color(0xFFFF4713),
        unselectedItemColor: const Color(0xFF58595B),
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
    );
  }
}




//primary: const Color(0xFF141D29),
//secondary: const Color(0xFF58595B),
//background: const Color(0xFFDCE2EB),
//tertiary: const Color(0xFFFF4713)



