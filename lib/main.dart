import 'package:flutter/material.dart';
import 'my_library.dart';
import 'package:booky/app_theme.dart';
void main() {
  runApp(BookyApp());
}

class BookyApp extends StatelessWidget{
  BookyApp({super.key});
  final ThemeData appTheme = BookyTheme.normal();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "",
      home: const DefaultTabController(
        length: 5,
        child: BookyAppHome(title: "My Library"),
      ),
    );
  }

}

class BookyAppHome extends StatefulWidget{

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
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCE2EB),
      appBar: _buildAppBar(_selectedIconIndex),
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
      body: IndexedStack(
        index: _selectedIconIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
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


  PreferredSizeWidget _buildAppBar(int selectedIconIndex) {
    PreferredSizeWidget buildMyLibraryAppBar() {
      return AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text('My Library'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF58595B),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Color(0xFF58595B),
            ),
            onPressed: () {},
          )
        ],
        bottom: const TabBar(
          tabs: [
            Tab(text: "Books"),
            Tab(text: "Shelves"),
            Tab(text: "Wishlist"),
          ],
        ),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      );
    }

    PreferredSizeWidget buildExploreAppBar() {
      return AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text('Explore'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.document_scanner_sharp,
              color: Color(0xFF58595B),
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10), // Adjust height as needed
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: Theme.of(context).primaryColor,
            child: const TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      );
    }

    PreferredSizeWidget buildDashboardAppBar() {
      return AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text('Dashboard'),
        bottom: const TabBar(
          tabs: [
            Tab(text: "Challenges"),
            Tab(text: "Statistics"),
          ],
        ),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      );
    }

    PreferredSizeWidget buildNotesAppBar() {
      return AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF58595B),
            ),
            onPressed: () {},
          ),
        ],
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      );
    }

    PreferredSizeWidget buildDefaultAppBar() {
      return AppBar(
        title: const Text('My Library'),
        bottom: const TabBar(
          tabs: [
            Tab(text: "Books"),
            Tab(text: "Shelves"),
            Tab(text: "Wishlist"),
          ],
        ),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
      );
    }

    switch (selectedIconIndex) {
      case 0:
        return buildMyLibraryAppBar();
      case 1:
        return buildExploreAppBar();
      case 2:
        return buildDashboardAppBar();
      case 3:
        return buildNotesAppBar();
      default:
        return buildDefaultAppBar();
    }
  }
}
