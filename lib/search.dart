import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  //1st list
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "venkat", "age": 25},
    {"id": 2, "name": "ben", "age": 25},
    {"id": 3, "name": "hel", "age": 56},
    {"id": 4, "name": "hari", "age": 25},
    {"id": 5, "name": "prt", "age": 25},
    {"id": 6, "name": "hod", "age": 56}
  ];
 // 2nd dummy list
  List<Map<String, dynamic>> _fetchUsers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers = _allUsers;
  }

  void filter(String fetch) {
    List<Map<String, dynamic>> result = [];
    if (fetch.isEmpty) {
      // it will display default list
      result = _allUsers;
    } else {
      // search option logic is here
      result = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(fetch.toLowerCase()))
          .toList();
    }
    setState(() {
      _fetchUsers = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (value) => filter(value),
            decoration: const InputDecoration(
                label: Text("Search"), suffixIcon: Icon(Icons.search_rounded)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _fetchUsers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                    //  key: ValueKey(_fetchUsers[index]['id']),
                      child: ListTile(
                        leading: Text(_fetchUsers[index]["id"].toString()),
                        title: Text(_fetchUsers[index]['name'].toString()),
                        subtitle: Text(_fetchUsers[index]["age"].toString()),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Persistent Bottom Navigation Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTabIndex = 0;

  List<Widget> _tabScreens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.red,
        inactiveColorPrimary: Colors.grey,
        textStyle: TextStyle(fontSize: 14),
        contentPadding: 5,
      ),

      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [ // Other widgets in the stack
          // Positioned(
          //   left: 40,
          //   right: 40,
          //   bottom: 50,
          //
          //     child: Container(
          //       height: 300,
          //       child: BottomSheet(
          //         onClosing: () {},
          //         builder: (context) => Container(
          //           width: 200,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(100)
          //           ),
          //        child: PersistentTabView(
          //          context,
          //          controller: PersistentTabController(initialIndex: _selectedTabIndex),
          //          screens: _tabScreens,
          //          items: _navBarItems(),
          //          confineInSafeArea: true,
          //          backgroundColor: Colors.black,
          //          handleAndroidBackButtonPress: true,
          //          resizeToAvoidBottomInset: true,
          //          stateManagement: true,
          //          hideNavigationBarWhenKeyboardShows: true,
          //          decoration: NavBarDecoration(
          //            borderRadius: BorderRadius.circular(10.0),
          //            colorBehindNavBar: Colors.white,
          //          ),
          //          popAllScreensOnTapOfSelectedTab: true,
          //          popActionScreens: PopActionScreensType.all,
          //          itemAnimationProperties: ItemAnimationProperties(
          //            duration: Duration(milliseconds: 200),
          //            curve: Curves.ease,
          //          ),
          //          screenTransitionAnimation: ScreenTransitionAnimation(
          //            animateTabTransition: true,
          //            curve: Curves.ease,
          //            duration: Duration(milliseconds: 200),
          //          ),
          //          onItemSelected: (index) {
          //            setState(() {
          //              _selectedTabIndex = index;
          //            });
          //          },
          //        ),
          //         ),
          //       ),
          //     ),
          //   ),


        ],
      )



    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Screen"),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search Screen"),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Screen"),
    );
  }
}
