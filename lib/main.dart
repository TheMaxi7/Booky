import 'package:booky/dashboard_statistics.dart';
import 'package:booky/data_manager.dart';
import 'package:booky/my_library_shelves.dart';
import 'package:booky/my_library_wishlist.dart';
import 'package:booky/notes.dart';
import 'package:booky/search_book_in_library_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_library_books.dart';
import 'package:booky/app_theme.dart';
import 'explore.dart';
import 'dashboard_challenges.dart';

void main() {
  runApp(BookyApp());
}

class BookyApp extends StatelessWidget {
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

class BookyAppHome extends StatefulWidget {
  const BookyAppHome({super.key, required this.title});

  final String title;

  @override
  State<BookyAppHome> createState() => _BookyAppHomeState();
}

class _BookyAppHomeState extends State<BookyAppHome>
    with TickerProviderStateMixin {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFDCE2EB),
        appBar: _buildAppBar(_selectedIconIndex),
        extendBody: true,
        drawer: Drawer(
          backgroundColor: const Color(0xFFDCE2EB),
          surfaceTintColor: const Color(0xFFDCE2EB),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person, size: 60,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 4),

                            GestureDetector(
                              onTap: () {

                              },
                              child: Text(
                                "View Profile",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const Divider( color: Color(0xFF141D29),),
                ListTile(
                  leading: const Icon(Icons.settings),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  title: const Text("Settings"),
                  onTap: () {

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.import_export),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  title: const Text("Import/Export"),
                  onTap: () {

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  title: const Text("Contact Us"),
                  onTap: () {

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_mark),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  title: const Text("FAQs"),
                  onTap: () {

                  },
                ),
              ],
            ),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchBookInLibrary()),
              );
            },
          ),
          if (_currentMyLibIndex == 0)
            PopupMenuButton(
              icon: const Icon(Icons.add,color: Color(0xFF58595B),),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'add_book',
                  child: Text('Add Book'),
                ),
                const PopupMenuItem(
                  value: 'add_shelf',
                  child: Text('Add Shelf'),
                ),
                const PopupMenuItem(
                  value: 'add_wishlist',
                  child: Text('Add to Wishlist'),
                ),
              ],
              onSelected: (value) {
                if (value == 'add_book') {
                  // Handle adding a book
                } else if (value == 'add_shelf') {
                  // Handle adding a shelf
                } else if (value == 'add_wishlist') {
                  // Handle adding to wishlist
                }
              },
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
        bottom:  PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SearchBar(
              leading: const Icon(Icons.search),
              constraints: BoxConstraints(minHeight: 30, maxWidth: (MediaQuery.of(context).size.width)/1.2),
              hintText: "Search by keyword or ISBN",
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
          builder: (context) => IconButton(
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
          builder: (context) => IconButton(
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
          builder: (context) => IconButton(
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
