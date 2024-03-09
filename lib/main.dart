import 'package:booky/dashboard_statistics.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/my_library_shelves.dart';
import 'package:booky/my_library_wishlist.dart';
import 'package:booky/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_library_books.dart';
import 'package:booky/app_theme.dart';
import 'explore.dart';
import 'dashboard_challenges.dart';
void main() {
  runApp(BookyApp());
}

class BookyApp extends StatelessWidget{
  BookyApp({super.key});
  final ThemeData appTheme = BookyTheme.normal();
  final DataManager _dataManager = DataManager();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataManager>(
      create: (_) => _dataManager,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: "",
        home: const BookyAppHome(title: "My Library"),
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

class _BookyAppHomeState extends State<BookyAppHome> with TickerProviderStateMixin{
  int _selectedIconIndex = 0;
  int _currentMyLibIndex = 0;

  late TabController _myLibraryTabController;
  late TabController _dashboardTabController;


  @override
  void initState() {
    super.initState();
    _myLibraryTabController = TabController(length: 3, vsync: this);
    _dashboardTabController = TabController(length: 2, vsync: this);

    _myLibraryTabController.addListener(_tabChanged);
  }

  void _tabChanged() {
    setState(() {
      _currentMyLibIndex = _myLibraryTabController.index;
    });
  }


  @override
  void dispose() {
    _myLibraryTabController.dispose();
    _dashboardTabController.dispose();

    super.dispose();
  }

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
        children: [
          TabBarView(
            controller: _myLibraryTabController,
            children: const [
              MyLibraryBooks(),
              MyLibraryShelves(),
              MyLibraryWishlist(),
            ],
          ),

          const Explore(),
          TabBarView(
            controller: _dashboardTabController,
            children: const [
              DashboardChallengesTab(),
              DashboardStatisticsTab(),
            ],
          ),
          const Notes(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
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
          if (_currentMyLibIndex == 0)
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Color(0xFF58595B),
              ),
              onPressed: () {},
            ),
        ],
        bottom: TabBar(
          controller: _myLibraryTabController,
          tabs: const [
            Tab(text: "Books"),
            Tab(text: "Shelves"),
            Tab(text: "Wishlist"),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
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
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
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
        bottom: TabBar(
          controller: _dashboardTabController,
          tabs: const [
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
        bottom: TabBar(
          controller: _myLibraryTabController,
          tabs: const [
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
